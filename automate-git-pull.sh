for FOLDER in `ls "./"`
do

	if [ -d $FOLDER ] && [ -d "${FOLDER}/.git" ]
	then
		printf "\e[36m [${FOLDER}] \e[0m \n"
		printf "\e[36m ================== \e[0m \n"
		printf "\e[36m ENTERING FOLDER \e[0m \n"
		cd $FOLDER  

		if git diff-index --quiet HEAD --
		then
			printf "\e[1;32m ALL GOOD, READY TO PULL. \e[0m \n"
			for BRANCH in `git branch --list|sed 's/\*//g'`
				do
					printf "\e[1;32m CHECKOUT && PULLING ${BRANCH} \e[0m \n"
					git checkout $BRANCH 
					git pull --prune
					printf "\e[1;32m (${FOLDER} - ${BRANCH}) PULLED \e[0m  \n\n"
				
				done
		else

			printf "\e[0;31m CONTAIN UNCOMMITED CHANGES, SO NOT PULLING ANYTHING. \e[0m \n"

		fi
		printf "\e[36m EXITING FOLDER \e[0m \n"
		cd ../;
		printf "\e[36m ================== \e[0m  \n\n"
	fi
done
