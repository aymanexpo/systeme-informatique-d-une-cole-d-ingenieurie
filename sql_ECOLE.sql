--realisé par Aymane Talibi élève inenieur à l'école marocaine de sciences de l'ingenieur EMSI RABAT 3IIR2
--Le 10/01/2020
CREATE TABLE système_educatif(
   systVille VARCHAR(50),
   PRIMARY KEY(systVille)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE service(
   ID_service INT,
   Num_employe INT,
   NomComplet VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE niveau(
   nivEtudes INT,
   PRIMARY KEY(nivEtudes)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE enseignement(
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(ID_service, Num_employe),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES service(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE surveillance(
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(ID_service, Num_employe),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES service(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE absence(
   nbre_Abs INT,
   type_Abs VARCHAR(50),
   PRIMARY KEY(nbre_Abs)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE comptable(
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(ID_service, Num_employe),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES service(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE mode_payement(
   mode VARCHAR(50),
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(mode),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES comptable(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE fillière(
   ID_fill INT,
   nom_fill VARCHAR(50) NOT NULL UNIQUE,
   mode VARCHAR(50),
   PRIMARY KEY(ID_fill),
   FOREIGN KEY(mode) REFERENCES mode_payement(mode)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE professeur(
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(ID_service, Num_employe),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES enseignement(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE élève(
   ID_Eleve INT,
   nomComplet VARCHAR(50) NOT NULL,
   Adresse VARCHAR(150) NOT NULL,
   Phone VARCHAR(11) NOT NULL,
   email VARCHAR(50) NOT NULL,
   systVille VARCHAR(50) NOT NULL,
   ID_fill INT NOT NULL,
   mode VARCHAR(50) NOT NULL,
   systVille_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(ID_Eleve),
   FOREIGN KEY(systVille) REFERENCES système_educatif(systVille),
   FOREIGN KEY(ID_fill) REFERENCES fillière(ID_fill),
   FOREIGN KEY(mode) REFERENCES mode_payement(mode),
   FOREIGN KEY(systVille_1) REFERENCES système_educatif(systVille)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE modèle(
   IDmodele INT,
   nomModele VARCHAR(50) NOT NULL,
   coefficient INT NOT NULL,
   president VARCHAR(50) NOT NULL,
   ID_Eleve INT NOT NULL,
   PRIMARY KEY(IDmodele),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE ingenieur(
   ID_Eleve INT,
   PRIMARY KEY(ID_Eleve),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE matiere(
   IDmatiere INT,
   nomMatiere VARCHAR(50) NOT NULL,
   coefficient VARCHAR(50) NOT NULL,
   IDmodele INT NOT NULL,
   PRIMARY KEY(IDmatiere),
   FOREIGN KEY(IDmodele) REFERENCES modèle(IDmodele)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE avoir(
   systVille VARCHAR(50),
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(systVille, ID_service, Num_employe),
   FOREIGN KEY(systVille) REFERENCES système_educatif(systVille),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES service(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE contenir(
   ID_fill INT,
   IDmatiere INT,
   nivEtudes INT,
   IDmodele INT,
   PRIMARY KEY(ID_fill, IDmatiere, nivEtudes, IDmodele),
   FOREIGN KEY(ID_fill) REFERENCES fillière(ID_fill),
   FOREIGN KEY(IDmatiere) REFERENCES matiere(IDmatiere),
   FOREIGN KEY(nivEtudes) REFERENCES niveau(nivEtudes),
   FOREIGN KEY(IDmodele) REFERENCES modèle(IDmodele)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE diviser(
   IDmodele INT,
   nivEtudes INT,
   PRIMARY KEY(IDmodele, nivEtudes),
   FOREIGN KEY(IDmodele) REFERENCES modèle(IDmodele),
   FOREIGN KEY(nivEtudes) REFERENCES niveau(nivEtudes)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE passer(
   ID_Eleve INT,
   nivEtudes INT,
   PRIMARY KEY(ID_Eleve, nivEtudes),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve),
   FOREIGN KEY(nivEtudes) REFERENCES niveau(nivEtudes)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE devenir(
   ID_Eleve INT,
   ID_Eleve_1 INT,
   PRIMARY KEY(ID_Eleve, ID_Eleve_1),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve),
   FOREIGN KEY(ID_Eleve_1) REFERENCES ingenieur(ID_Eleve)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE diplomer(
   systVille VARCHAR(50),
   ID_Eleve INT,
   PRIMARY KEY(systVille, ID_Eleve),
   FOREIGN KEY(systVille) REFERENCES système_educatif(systVille),
   FOREIGN KEY(ID_Eleve) REFERENCES ingenieur(ID_Eleve)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE enseigner(
   IDmatiere INT,
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(IDmatiere, ID_service, Num_employe),
   FOREIGN KEY(IDmatiere) REFERENCES matiere(IDmatiere),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES professeur(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE tester(
   ID_Eleve INT,
   ID_service INT,
   Num_employe INT,
   PRIMARY KEY(ID_Eleve, ID_service, Num_employe),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES professeur(ID_service, Num_employe)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE controler(
   ID_service INT,
   Num_employe INT,
   ID_service_1 INT,
   Num_employe_1 INT,
   nbre_Abs INT,
   PRIMARY KEY(ID_service, Num_employe, ID_service_1, Num_employe_1, nbre_Abs),
   FOREIGN KEY(ID_service, Num_employe) REFERENCES professeur(ID_service, Num_employe),
   FOREIGN KEY(ID_service_1, Num_employe_1) REFERENCES surveillance(ID_service, Num_employe),
   FOREIGN KEY(nbre_Abs) REFERENCES absence(nbre_Abs)
);
--realisé par Aymane Talibi élève inenieur
CREATE TABLE absentir(
   ID_Eleve INT,
   nbre_Abs INT,
   PRIMARY KEY(ID_Eleve, nbre_Abs),
   FOREIGN KEY(ID_Eleve) REFERENCES élève(ID_Eleve),
   FOREIGN KEY(nbre_Abs) REFERENCES absence(nbre_Abs)
);


--realisé par Aymane Talibi élève inenieur