#http://www.thegameofcode.com/2013/06/deployment-managed-by-git-tags.html
ENV=$1;

if [ "$ENV" = "" ]
then
echo "No environment provided as argument."
fi

echo "Updating " $ENV;

git fetch --tags -f;

git checkout tags/$ENV;

echo "Done.";