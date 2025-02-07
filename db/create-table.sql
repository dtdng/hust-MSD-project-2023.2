CREATE TABLE account (
  account_id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password TEXT NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  user_role VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE learner (
  learner_id SERIAL PRIMARY KEY,
  age INT,
  occupation VARCHAR(100),
  account_id INT REFERENCES account(account_id)
);

CREATE TABLE category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

CREATE TABLE video (
  video_id SERIAL PRIMARY KEY,
  video_title VARCHAR(255) NOT NULL,
  category_id INT REFERENCES category(category_id),
  level VARCHAR(50),
  source_link TEXT NOT NULL
);

CREATE TABLE track (
  track_id INT,
  video_id INT REFERENCES video(video_id),
  start_time FLOAT NOT NULL,
  end_time FLOAT NOT NULL,
  transcript TEXT NOT NULL,
  PRIMARY KEY (video_id, track_id)
);


CREATE TABLE tag (
  tag_id SERIAL PRIMARY KEY,
  tag_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE tag_to_video (
  tag_id INT REFERENCES tag(tag_id),
  video_id INT REFERENCES video(video_id),
  PRIMARY KEY(tag_id, video_id)
);

CREATE TABLE history (
  history_id SERIAL PRIMARY KEY,
  learner_id INT REFERENCES learner(learner_id),
  video_id INT REFERENCES video(video_id),
  last_watched_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE progress (
  progress_id SERIAL PRIMARY KEY,
  learner_id INT REFERENCES learner(learner_id),
  video_id INT REFERENCES video(video_id),
  track_id INT,
  score INT CHECK (score >= 0 AND score <= 100),
  last_updated_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (video_id, track_id) REFERENCES track(video_id, track_id)
);


CREATE TABLE favorite (
  favorite_id SERIAL PRIMARY KEY,
  learner_id INT REFERENCES learner(learner_id),
  video_id INT REFERENCES video(video_id)
);

select * from category;
select * from video;
select * from track

