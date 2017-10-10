create table spatialDB(                                            
ID Integer not null,
Name varchar(50) not null,                                                            
 Point geometry not null,                                                       
Primary key(ID));

insert into spatialDB values                                       
	(1,'My Home',ST_MakePoint(-118.290372,34.027550)),                               
	(2,'Vermont/Jefferson',ST_MakePoint(-118.291613,34.025473)),                        
	(3,'Exposition/Vermont',ST_MakePoint(-118.291526,34.018355)),                                    
	(4,'Jefferson/Figueroa',ST_MakePoint(-118.280027,34.022035)),                       
	(5,'Figueroa/Exposition',ST_MakePoint(-118.282316,34.018428)),                                    
	(6,'Olin Hall',ST_MakePoint(-118.289694,34.020625)),                        
	(7,'Massman Theartre',ST_MakePoint(-118.289975,34.022699)),                        
	(8,'Bovard Auditorium',ST_MakePoint(-118.285538,34.020923)),                                    
	(9,'Leavey Library',ST_MakePoint(-118.282819,34.021796)),
	(10,'Doheny Memorial',ST_MakePoint(-118.283755,34.020138)),
	(11,'Capone Lab',ST_MakePoint(-118.284976,34.019706));

	select ST_AsText(ST_ConvexHull
                 (ST_Collect(Point))) from spatialDB;

POLYGON((-118.291526 34.018355,-118.291613 34.025473,-118.290372 34.02755,-118.280027 34.022035,-118.282316 34.018428,-118.291526 34.018355))

	select ST_AsText(ST_ConvexHull
                 (ST_Collect(Point))) from spatialDB where ID BETWEEN 1 AND 3 OR ID BETWEEN 9 AND 11;

    POLYGON((-118.291526 34.018355,-118.291613 34.025473,-118.290372 34.02755,-118.282819 34.021796,-118.283755 34.020138,-118.284976 34.019706,-118.291526 34.018355))


    select ST_AsText(ST_ConvexHull
                 (ST_Collect(Point))) from spatialDB where ID BETWEEN 4 AND 8;

    POLYGON((-118.282316 34.018428,-118.289694 34.020625,-118.289975 34.022699,-118.280027 34.022035,-118.282316 34.018428))

    SELECT ST_Disjoint(
    	(
    		select ST_AsText(ST_ConvexHull
                 (ST_Collect(Point))) from spatialDB where ID BETWEEN 1 AND 3 OR ID BETWEEN 9 AND 11
    	),
    	(
    		select ST_AsText(ST_ConvexHull
                 (ST_Collect(Point))) from spatialDB where ID BETWEEN 4 AND 8
    	)
    );
