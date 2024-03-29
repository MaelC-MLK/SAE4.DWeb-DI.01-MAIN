<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Movie;
use App\Entity\Category;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Doctrine\ORM\EntityManagerInterface;




class ApiController extends AbstractController
{
    #[Route('/api/movie', name: 'app_api_movies')]
    public function readMovies(EntityManagerInterface $entityManager, SerializerInterface $serializer): Response
    {
        $movieRepository = $entityManager->getRepository(Movie::class);
        $movies = $movieRepository->findAll();
    
        $data = $serializer->normalize($movies, null, ['groups' => 'json_movie']);
        $response = new JsonResponse($data);
    
        return $response;
    } 

    #[Route('/api/movie/{id}', name: 'app_api_movie')]
    public function readMovie(Movie $mov, SerializerInterface $serializer ): Response
    {
      $data = $serializer->normalize($mov, null, ['groups' => 'json_movie']);
      $response = new JsonResponse( $data );
      return $response;
    }

    #[Route('/api/category', name: 'app_api_categories')]
    public function readCategories(EntityManagerInterface $entityManager, SerializerInterface $serializer): Response
    {
        $categoryRepository = $entityManager->getRepository(Category::class);
        $categories = $categoryRepository->findAll();
    
        $data = $serializer->normalize($categories, null, ['groups' => 'json_category']);
        $response = new JsonResponse($data);
    
        return $response;
    }

    #[Route('/api/category/{id}', name: 'app_api_category')]
    public function readCategory(Category $cat, SerializerInterface $serializer ): Response
    {
      $data = $serializer->normalize($cat, null, ['groups' => 'json_category']);
      $response = new JsonResponse( $data );
      return $response;
    }
}
