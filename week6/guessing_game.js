images = [
  { kind: "capybara", src: "http://38.media.tumblr.com/3b0eca1bbd899ca1e9b0e5038d6dcded/tumblr_mrt5nyeD1K1r03kk7o1_500.jpg" },
  { kind: "guinea_pig", src: "http://www.photographyblogger.net/wp-content/uploads/2012/12/242.jpg" },
  { kind: "guinea_pig", src: "http://www.photographyblogger.net/wp-content/uploads/2012/12/223.jpg" },
  { kind: "capybara", src: "http://gianthamster.com/wp-content/uploads/2009/10/2009_10_04_06_tBabyCapy.jpg" },
  { kind: "guinea_pig", src: "http://cuteanimalpicturesandvideos.com/wp-content/uploads/guinea-pig.jpg" },
  { kind: "capybara", src: "https://camo.githubusercontent.com/fd0994c872810c815d6b1fab45e0cb1f07e35de3/687474703a2f2f75706c6f61642e77696b696d656469612e6f72672f77696b6970656469612f636f6d6d6f6e732f622f62632f43617079626172615f6861726e6573732e6a7067" }
];

var currentImage = 0;
var correctGuesses = 0;

function preloadImages() {
  $("#image").attr("src", images[currentImage].src);

  $.each(images, function() {
    (new Image()).src = this.src;
  });
}

function setImage() {
  $("#image").fadeTo(500, 0, function() {
    $("#image").attr("src", images[currentImage].src);
    $("#image").fadeTo(500, 1);
  });
}

function isCorrect(kind) {
  return kind === images[currentImage].kind
}

function handleCorrect() {
  correctGuesses++;
  $("#result").html("Correct");
  $("#result").attr("class", "correct");
}

function handleIncorrect() {
  $("#result").html("Incorrect");
  $("#result").attr("class", "incorrect");
}

function next() {
  currentImage++;
  if(images[currentImage]) {
    setImage();
  } else {
    displayResults();
  }
}

function displayResults() {
  $("button").hide();
  $("#image").hide();
  $("#result").attr("class", "final-results");
  $("#result").html("You got " + correctGuesses + " out of " + images.length + " guesses correct.");
}

$(function() {
  preloadImages();

  $("button").click(function() {
    if(isCorrect(this.id)) {
      handleCorrect();
    } else {
      handleIncorrect();
    }
    next();
  });
});
