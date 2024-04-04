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
use App\Repository\MovieRepository;
use App\Repository\UserRepository;
use App\Entity\User;
use App\Entity\Watchlist;
use App\Repository\WatchlistRepository;
use App\Repository\CategoryRepository;




class ApiController extends AbstractController
{
    public function __construct(SerializerInterface $serializer)
{
    $this->serializer = $serializer;
}

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

    #[Route('/api/movies/front', name: 'app_api_movies_front')]
    public function readMoviesFront(MovieRepository $movieRepository, SerializerInterface $serializer): Response
    {
        $movies = $movieRepository->findByMiseEnAvant();
        $data = $serializer->normalize($movies, null, ['groups' => 'json_category']);
        $response = new JsonResponse($data);
        return $response;
    }

    #[Route('/api/watchlist/user/{id}', name: 'app_api_user_watchlists', methods: ['GET'])]
    public function getUserWatchlist(int $id, WatchlistRepository $watchlistRepository, SerializerInterface $serializer): Response
    {
        $watchlist = $watchlistRepository->findOneBy(['user' => $id]);
    
        if (!$watchlist) {
            return $this->json(['message' => 'No watchlist found for this user'], 404);
        }
    
        $data = $serializer->normalize($watchlist, null, [
            'groups' => 'json_watchlist',
            'circular_reference_handler' => function ($object) {
                return $object->getId();
            }
        ]);
    
        return new JsonResponse($data);
    }

    #[Route('/api/watchlist/user/{id}/delete', name: 'app_api_user_watchlist_delete', methods: ['DELETE'])]
    public function deleteUserWatchlist(int $id, EntityManagerInterface $entityManager): Response
    {
        $watchlistRepository = $entityManager->getRepository(Watchlist::class);
        $watchlist = $watchlistRepository->findOneBy(['user' => $id]);
    
        if (!$watchlist) {
            return $this->json(['message' => 'No watchlist found for this user'], 404);
        }
    
        // Get the movies in the watchlist
        $movies = $watchlist->getMovies();
    
        // Remove all movies from the watchlist
        foreach ($movies as $movie) {
            $watchlist->removeMovie($movie);
        }
    
        $entityManager->flush();
    
        return $this->json(['message' => 'Watchlist movies deleted successfully']);
    }
    
    #[Route('/api/watchlist/user/{userId}/movie/{movieId}/add', name: 'app_api_user_watchlist_add_movie', methods: ['POST'])]
    public function addMovieToUserWatchlist(int $userId, int $movieId, EntityManagerInterface $entityManager): Response
    {
        $userRepository = $entityManager->getRepository(User::class);
        $movieRepository = $entityManager->getRepository(Movie::class);
        $watchlistRepository = $entityManager->getRepository(Watchlist::class);
    
        $user = $userRepository->find($userId);
        $movie = $movieRepository->find($movieId);
        $watchlist = $watchlistRepository->findOneBy(['user' => $userId]);
    
        if (!$user || !$movie || !$watchlist) {
            return $this->json(['message' => 'User, movie or watchlist not found'], 404);
        }
    
        // Add the movie to the watchlist
        $watchlist->addMovie($movie);
    
        $entityManager->flush();
    
        return $this->json(['message' => 'Movie added to watchlist successfully']);
    }
}
