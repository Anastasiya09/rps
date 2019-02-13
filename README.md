# ROCK – PAPER – SCISSORS

This is the game "ROCK – PAPER – SCISSORS".

## Installing

**First way:**

1.  download docker image and run, using following command:
```
docker run  -p 3000:3000 sweeticherry/rps:0.0.1
```

**Second way:**
1.  Install ruby 2.6.1
2.  Install gems
3.  Run application
```
rails s
```


After that, you can check this application in

```
http://127.0.0.1:3000
```

## Rules

Choose one of 3 images(rock, paper or scrissors) and wait your opponent's turn.
After that game return resuld following the next conditions:

* Rock beats scissors
* Scissors beats paper
* Paper beats rock