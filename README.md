# MSM API

## Standard Workflow

 1. Set up the project: `bin/setup`
 1. Start the web server by running `bin/server``.
 1. Navigate to your live application preview.
 1. As you work, remember to navigate to `/git` and **commit often as you work.**
 1. Make new branches freely to experiment! _Especially_ before starting on a new task.
 1. Run `rails grade` as often as you like to see how you are doing, but **make sure you test your app manually first to make sure it matches the target's behavior first**.

## Routes to define

Let's make the following URLs work:

## READ

```
/directors/youngest
```

```
/directors/eldest
```

```
/movies/last_decade
```

```
/movies/short
```

```
/movies/long
```

```
/directors/[ANY EXISTING ID NUMBER]/filmography
```

```
/movies/[ANY EXISTING ID NUMBER]/director
```

```
/movies/[ANY EXISTING ID NUMBER]/characters
```

```
/movies/[ANY EXISTING ID NUMBER]/cast
```

```
/actors/[ANY EXISTING ID NUMBER]/characters
```

```
/actors/[ANY EXISTING ID NUMBER]/filmography
```

## DELETE

```
/delete_movie/[ANY EXISTING ID NUMBER]
```

```
/delete_director/[ANY EXISTING ID NUMBER]
```

```
/delete_actor/[ANY EXISTING ID NUMBER]
```

```
/delete_character/[ANY EXISTING ID NUMBER]
```

## CREATE

```
/insert_director_record?input_name=Josh Cooley
```

```
/insert_movie_record?input_title=Toy Story 4&input_year=2019&director_id=35&input_duration=100&input_description=When a new toy called "Forky" joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be for a toy.
```

```
/insert_actor_record?input_name=Annie Potts
```

```
/insert_character_record?name=Bo Peep&actor_id=653&movie_id=51
```

## UPDATE

```
/update_movie/[ANY EXISTING ID NUMBER]?input_image_url=http://some.updated.url
```

```
/update_director/[ANY EXISTING ID NUMBER]?input_name=Changed Name&input_bio=A Better Bio
```

```
/update_actor/[ANY EXISTING ID NUMBER]?input_name=Fixed Name&input_bio=A Longer Bio
```

