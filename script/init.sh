#! bin/bash
PROJECT_NAME='vue-project'
yn='N'
pro=''
read -p "Do you want to rename vue's project name('${PROJECT_NAME}')?(y/N) : " yn

if [[ $yn =~ [yY] ]] ; then
    while true
    do
        read -p "What is project name?: " PROJECT_NAME
        read -p "your project name is ${PROJECT_NAME}. ok?(y/N): " yn
        if [[ $yn =~ [yY] ]] ; then
            break;
        else
            continue;
        fi
    done
fi
echo "PROJECT_NAME=${PROJECT_NAME}" | sed -e 's/$//g'>.env
docker-compose run --rm app sh -c "vue create ${PROJECT_NAME} && cd ${PROJECT_NAME} && mv * .[^\.]* .. && cd .. && rm -rf ${PROJECT_NAME}"