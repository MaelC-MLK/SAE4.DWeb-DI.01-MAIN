<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;


class AuthenticationController extends AbstractController
{
    #[Route('/api/user', name: 'api_user', methods:'GET')]
    public function User(TokenStorageInterface $tokenStorage): Response
    {
        $token = $tokenStorage->getToken();
        if (!$token){
            return $this->json([
                'message' => 'Not authenticated.',
                'status' => 401 
            ], 401);
        }

        $user = $token->getUser();

        error_log(print_r($user, true));


        if (!$user) {
            return $this->json([
                'message' => 'Not authenticated.',
                'status' => 401 
            ], 401);
        }

        return $this->json([
            'email' => $user->getEmail(),
            'pseudo' => $user->getPseudo(),
            'id' => $user->getId()
        ]);
    }
}