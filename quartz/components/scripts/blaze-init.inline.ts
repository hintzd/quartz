import BlazeSlider from "blaze-slider";

const el = document.querySelector('.blaze-slider');

new BlazeSlider(el, {
    all: {
      enableAutoplay: true,
      autoplayInterval: 9000,
      transitionDuration: 1000,
      slidesToShow: 1,
    },
    '(max-width: 900px)': {
      slidesToShow: 1,
    },
    '(max-width: 500px)': {
      slidesToShow: 1,
    },
  });