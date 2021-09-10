## migrates boost files from folder to docker volume
## BEWARE paths are env HARDCODED!!

if [ -z ${DATA_FOLDER+x} ]
then 
    echo "ABORTING:    `DATA_FOLDER` is unset"
else 
    echo "Coping from: ${DATA_FOLDER}"
    ls $DATA_FOLDER
    ## pogstres
    sudo cp -p -R $DATA_FOLDER/postgres/data/. /var/lib/docker/volumes/boost_dev_gauthier_postgres/_data/

    ## backup
    sudo cp -p -r $DATA_FOLDER/backup/db/. /var/lib/docker/volumes/boost_dev_gauthier_backup/_data/

    ## user data
    sudo cp -p -r $DATA_FOLDER/user/. /var/lib/docker/volumes/boost_dev_gauthier_user/_data/

    ## redis db
    sudo cp -p -r $DATA_FOLDER/redis/data/. /var/lib/docker/volumes/boost_dev_gauthier_redis/_data
fi
