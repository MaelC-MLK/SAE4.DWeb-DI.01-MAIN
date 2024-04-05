<?php

Namespace App\Controller;

 

use App\Repository\UserRepository;

use Doctrine\ORM\EntityManagerInterface;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

use Symfony\Component\Routing\Attribute\Route;

use Symfony\Component\HttpFoundation\Response;

use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

use Symfony\Component\HttpFoundation\Request;

use Symfony\Component\HttpFoundation\JsonResponse;

use App\Entity\User;

use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTTokenManagerInterface;

use Symfony\Component\Security\Core\Exception\AuthenticationException;

use Lexik\Bundle\JWTAuthenticationBundle\Encoder\JWTDecoderInterface;

use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;

use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;

use Symfony\Component\Serializer\SerializerInterface;

use App\Entity\Watchlist;

use App\Repository\WatchlistRepository;

use App\Entity\Movie;








class SecurityController extends AbstractController

{

    private $user;

    private $manager;

    private $encoder;

 

    public function __construct(UserRepository $user, EntityManagerInterface $manager, UserPasswordHasherInterface $userPasswordHasher)

    {

        $this->user = $user;

        $this->manager = $manager;

        $this->encoder = $userPasswordHasher;

    }

    #[Route(path: '/login', name: 'app_login')]

    public function login(AuthenticationUtils $authenticationUtils): Response

    {

        // get the login error if there is one

        $error = $authenticationUtils->getLastAuthenticationError();

 

        // last username entered by the user

        $lastUsername = $authenticationUtils->getLastUsername();

 

        return $this->render('security/login.html.twig', [

            'last_username' => $lastUsername,

            'error' => $error,

        ]);

    }

 

    #[Route(path: '/logout', name: 'app_logout')]

    public function logout(): void

    {

        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');

    }

 

    #[Route(path: '/api/login', name:'api_login', methods:['POST'])]

    public function apiLogin(){

        $user = $this->security->getUser();

        return $this->json([

            'username' => $user->getEmail(),

        ]);

    }

    #[Route('/api/updatepseudo', name: 'app_api_updatepseudo', methods: 'POST')]
    public function updatePseudo(Request $request): Response
    {
        $data = json_decode($request->getContent(), true);

        if ($data === null || !isset($data['id'], $data['pseudo'], $data['email'])) {
            return new JsonResponse(['status' => 'Invalid data'], Response::HTTP_BAD_REQUEST);
        }

        $user = $this->manager
            ->getRepository(User::class)
            ->find($data['id']);

        if (!$user) {
            throw $this->createNotFoundException('No user found for id '.$data['id']);
        }

        $user->setPseudo($data['pseudo']);
        $user->setEmail($data['email']);

        $this->manager->persist($user);
        $this->manager->flush();

        return new JsonResponse(['status' => 'User updated'], Response::HTTP_OK);
    }

    #[Route('/api/updatepassword', name: 'app_api_updatepassword', methods: 'POST')]
    public function updatePassword(Request $request, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        $data = json_decode($request->getContent(), true);

        if ($data === null || !isset($data['id'], $data['password'])) {
            return new JsonResponse(['status' => 'Invalid data'], Response::HTTP_BAD_REQUEST);
        }

        $user = $this->manager
            ->getRepository(User::class)
            ->find($data['id']);

        if (!$user) {
            throw $this->createNotFoundException('No user found for id '.$data['id']);
        }

        $user->setPassword($userPasswordHasher->hashPassword($user, $data['password']));

        $this->manager->persist($user);
        $this->manager->flush();

        return new JsonResponse(['status' => 'Password updated'], Response::HTTP_OK);
    }

}