import React from 'react';
import Carousel from "react-multi-carousel";
import "react-multi-carousel/lib/styles.css";
import { Link } from 'react-router-dom';
import Card from '../Card/Card.jsx';
import Button from "../Components/button/Button";


const responsive = {
  superLargeDesktop: {
    breakpoint: { max: 4000, min: 1700 },
    items: 5
  },
  desktop: {
    breakpoint: { max: 1700, min: 1160 },
    items: 3
  },
  tablet: {
    breakpoint: { max: 1160, min: 807 },
    items: 2
  },
  mobile: {
    breakpoint: { max: 807, min: 0 },
    items: 1
  }
};

function CustomCarousel({ data, deviceType }) {

  return (
    <Carousel
      customRightArrow={
        <Button className="absolute top-1/2 right-10" intent={`primary`} size="small">
          
        </Button>
      }
      customLeftArrow={
        <Button className="absolute top-1/2 left-10" intent={`primary`} size="small">
          
        </Button>
      }
      slidesToSlide={1}
      swipeable={true}
      draggable={true}
      showDots={true}
      responsive={responsive}
      ssr={true}
      infinite={true}
      keyBoardControl={true}
      customTransition="all .5s"
      transitionDuration={500}
      containerClass="carousel-container"
      removeArrowOnDeviceType={["tablet", "mobile"]}
      deviceType={deviceType}
      dotListClass="custom-dot-list-style"
      itemClass="carousel-item-padding-5-px"
    >
        {data.map((movie, index) => (
          <Link to={`/movie/${movie.id}`} key={index}>
          <Card {...movie} />
          </Link>
      ))}
    </Carousel>
  );
}

export default CustomCarousel;