<?php

namespace App\Entity;

use App\Repository\MovieRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;


#[ORM\Entity(repositoryClass: MovieRepository::class)]
#[Groups(['json_movie'])]
class Movie
{
   #[ORM\Id]
   #[ORM\GeneratedValue]
   #[ORM\Column]
    #[Groups(['json_category', 'json_watchlist'])]
   private ?int $id = null;


    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $name = null;

    #[ORM\ManyToMany(targetEntity: Category::class, inversedBy: 'movies')]
    private Collection $category;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $year = null;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $realisateur = null;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $img = null;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $lien = null;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $description = null;

    #[ORM\Column(length: 255)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $bigimg = null;

    #[ORM\Column(length: 20)]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?string $duree = null;

    #[ORM\Column]
    #[Groups(['json_category', 'json_watchlist'])]
    private ?bool $misenavant = null;

    #[ORM\ManyToMany(targetEntity: Watchlist::class, mappedBy: 'movies')]
    private Collection $watchlist;


    
    public function __construct()
    {
        $this->category = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Category>
     */
    public function getCategory(): Collection
    {
        return $this->category;
    }

    public function addCategory(Category $category): static
    {
        if (!$this->category->contains($category)) {
            $this->category->add($category);
        }

        return $this;
    }

    public function removeCategory(Category $category): static
    {
        $this->category->removeElement($category);

        return $this;
    }

    public function getYear(): ?string
    {
        return $this->year;
    }

    public function setYear(string $year): static
    {
        $this->year = $year;

        return $this;
    }

    public function getRealisateur(): ?string
    {
        return $this->realisateur;
    }

    public function setRealisateur(string $realisateur): static
    {
        $this->realisateur = $realisateur;

        return $this;
    }

    public function getImg(): ?string
    {
        return $this->img;
    }

    public function setImg(string $img): static
    {
        $this->img = $img;

        return $this;
    }

    public function getLien(): ?string
    {
        return $this->lien;
    }

    public function setLien(string $lien): static
    {
        $this->lien = $lien;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getBigimg(): ?string
    {
        return $this->bigimg;
    }

    public function setBigimg(string $bigimg): static
    {
        $this->bigimg = $bigimg;

        return $this;
    }

    public function getDuree(): ?string
    {
        return $this->duree;
    }

    public function setDuree(string $duree): static
    {
        $this->duree = $duree;

        return $this;
    }

    public function isMisenavant(): ?bool
    {
        return $this->misenavant;
    }

    public function setMisenavant(bool $misenavant): static
    {
        $this->misenavant = $misenavant;

        return $this;
    }

        /**
     * @return Collection<int, Watchlist>
     */
    public function getWatchlist(): Collection
    {
        return $this->watchlist;
    }
        
    
    public function __toString(): string
    {
        return $this->name;
    }

}