
#base of sql 

# INSERT INTO `` (`id`,`fileName`,`productId`,`createdAt`,`updatedAt`) 
# VALUES (2,'LemonPie.jpeg',2,'0000-00-00 00:00:00','0000-00-00 00:00:00');

gsed -i -r "s/\`(\w+)\`/\1/g" tech-bakers-dml.sql
gsed -i -r "s/(\`\`)/products/g" tech-bakers-dml.sql
gsed -i -r "s/id,//g" tech-bakers-dml.sql
gsed -i -r "s/\([0-9]+,/(/g" tech-bakers-dml.sql
# gsed -r "s/\'[1-9]+\'//g" tech-bakers-dml.sql

#date time regex 
gsed -i -r "s/\0{4}-\0{2}-\0{2}/1000-01-01/g" tech-bakers-dml.sql