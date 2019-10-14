stardog-admin db drop -n empDeptDB
stardog-admin db create -o reasoning.sameas=FULL -n empDeptDB ../Schema.org/all-layers.ttl 
stardog data add empDeptDB 1\ addToSchemaOrg.n3
   
echo "Adding dept instances"
stardog data add empDeptDB 2\ dept.n3  
echo "Adding emp instances"
stardog data add empDeptDB 3\ emp.n3 
echo "Adding EVAs"  
stardog query empDeptDB    4\ EVAs.sparql 
stardog query empDeptDB    5\ testDeptQuery.sparql  
stardog query -r empDeptDB 5\ testDeptQuery.sparql  
stardog query -r empDeptDB 5\ testEmpQuery.sparql  
