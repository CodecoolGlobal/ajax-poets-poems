/*
    Database initialization script that runs on every web-application redeployment.
*/
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS poems CASCADE;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    name TEXT NOT NULL,
	CONSTRAINT email_not_empty CHECK (email <> ''),
	CONSTRAINT password_not_empty CHECK (password <> '')
);

CREATE TABLE poems (
  id SERIAL NOT NULL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (email, password, name) VALUES
	('user1@user1', 'user1', 'Ady Endre'), -- 1
	('user2@user2', 'user2', 'Arany János'); -- 2

INSERT INTO poems (title, content, user_id) VALUES
  ('A csókok átka',
  'Valami szent, nagy éjszakán
  Vad nászban megfogant az élet
  S azóta tart a nász örökké,
  Minden kis mozgás csókba téved.
  Csókok világa a világunk,
  Csókban fogan a gondolat,
  Kicsi kis agyvelő-csomócskák
  Cserélnek tüzes csókokat
  S a legforróbb csókból szület meg
  A legszebb, legnagyobb ige,
  Mely hódítóan csap belé
  A végtelenbe, semmibe.
  S a leglanyhább csókból fakadt ki
  A szürkeség, a régi mása:
  Nincs vad párzás, nincs tüzes csók ma
  S nincs a világnak messiása.
  Úgy van talán: szép a világ s jó,
  Mi vagyunk satnyák, betegek,
  Jégfagyos csókokban fogantunk
  S a fagy a lelkünk vette meg.
  Szent kéj a csók és szent az élet,
  A párzás végtelen sora
  S átok a csók, átok az élet,
  Ha nincs a csóknak mámora.
  Az eltűrt csókok tunya nászán,
  A langyos csókok éjjelén
  Az átok egyre nő fölöttünk
  S így lesz az élet lomha, vén
  S így leszünk mi, párzó királyok,
  Kopottak, búsak, betegek,
  Kiknek csókolni szomjas tűzzel
  Már nem szabad és nem lehet.
  Ha szomjas ajkak szomjas csókot
  Csak szomjas ajkra hintenek,
  Ma ez a föld üdvök Olimpja
  S nem laknak itt: csak istenek.', 1),
  ('Az elkésett',
  'Későn keltél, öreg! hova indulsz már ma?
  Nyakadon a vénség tehetetlen járma;
  Messze utad célját soha el nem éred:
  Jobb, ha maradsz s „lement napodat dicséred.”
  „Tudom, sikerűltén sohasem örűlök,
  Szándékomnak tán már elején kidűlök:
  De hiú tett is jobb áldatlan panasznál:
  Űz gondot, unalmat, és a mozgás használ.', 2);
