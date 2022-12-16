SELECT Nom,Grade
FROM Personnel
WHERE IdPersonnel IN (SELECT IdScientifique
                        FROM Encadre
                        WHERE IdDoctorant="d001")



SELECT ae.Nom,le.Pays FROM LaboratoireExterne le JOIN AuteurExterne ae ON le.IdLaboExterne=ae.IdLaboExterne 
    WHERE ae.IdAuteurExterne IN (SELECT IdAuteurExterne FROM EcritExt 
        WHERE IdPublication IN (SELECT IdPublication FROM Publication 
            WHERE AnneePublication <= 2020 and AnneePublication >= 2016 in (SELECT IdPublication FROM Ecrit 
                WHERE IdPersonnel IN (SELECT IdPersonnel FROM Personnel 
                    WHERE Nom="Azi" and Prenom="Jean"))))

SELECT COUNT(DISTINCT IdAuteurExterne) FROM  EcritExt 
    WHERE IdPublication IN (SELECT IdPublication FROM Ecrit WHERE idPersonnel = "S001")

SELECT COUNT(DISTINCT Pays) FROM  LaboratoireExterne 
    WHERE IdLaboExterne IN (SELECT IdLaboExterne FROM AuteurExterne 
        WHERE IdAuteurExterne IN (SELECT IdAuteurExterne FROM EcritExt 
            WHERE IdPublication IN (Select IdPublication FROM Publication 
                WHERE ClasseConf="A")));

SELECT IdPersonnel, COUNT(DISTINCT IdPublication) FROM Ecrit 
    WHERE IdPersonnel IN (SELECT IdScientifique FROM Scientifique
        GROUP BY IdPersonnel; 

SELECT COUNT(DISTINCT IdDoctorant) FROM Doctorant 
    WHERE DateSoutenance!=NULL;

SELECT Nom, Prénom FROM Personnel 
    WHERE IdPersonnel NOT IN (SELECT IdScientifique FROM Encadre 
            WHERE IdScientifique IN (SELECT IdChercheur FROM Chercheur));


SELECT Nom, Prénom FROM Personnel
    WHERE IdPersonnel NOT IN (SELECT IdPersonnel FROM Ecrit)
INTERSECT
SELECT Nom, Prénom FROM Personnel
    WHERE IdPersonnel NOT IN (SELECT IdScientifique FROM Encadre 
            WHERE IdScientifique IN (SELECT IdChercheur FROM Chercheur));
 
 
SELECT Nom, Prénom FROM Personnel
    WHERE IdPersonnel IN (SELECT IdChercheur FROM Chercheur
        WHERE IdChercheur IN (SELECT IdScientifique FROM Encadre
            WHERE IdChercheur NOT IN (SELECT IdScientifique FROM Encadre
                WHERE IdDoctorant IN (SELECT IdDoctorant FROM Doctorant
                    WHERE DateSoutenance != NULL)));

SELECT IdPersonnel, Nom, Prénom FROM Personnel 
    WHERE IdPersonnel IN (SELECT IdDoctorant, COUNT(DISTINCT IdScientifique) FROM Encadre 
        GROUP BY IdDoctorant HAVING COUNT(IdScientifique)=1);


SELECT IdPersonnel, Nom, Prénom FROM Personnel 
    WHERE IdPersonnel IN (SELECT IdChercheur FROM Chercheur 
        WHERE IdChercheur IN (SELECT IdScientifique, COUNT (DISTINCT IdDoctorant) FROM Encadre
            GROUP BY IdScientifique HAVING COUNT(DISTINCT IdDoctorant)>4)))
-- Il faut faire un JOIN pour recuperer COUNT(DISTINCT IdDoctorant)
