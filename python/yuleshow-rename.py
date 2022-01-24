#!/usr/bin/python3
import os, sys
import os.path
from os import path
import shutil
import glob
from datetime import datetime
from exif import Image
import random

def move_photo(my_photo):
    print ("Get the call")
    with open(my_photo, 'rb') as image_file:
        my_image = Image(image_file)

    try:
        my_datetime_temp  = my_image.datetime_original
    except AttributeError:
        now = datetime.now()
        my_datetime_temp  = '2222:22:22 '+str(random.randint(100000, 999999))

        
    my_datetime = my_datetime_temp.replace(':', '')
    
    dt        = my_datetime.split(' ')
    new_date  = dt[0]
    new_time  = dt[1]

    try:
        new_make_temp  = my_image.make
    except AttributeError:
        new_make_temp  = "NONE"

    new_make = new_make_temp.replace(' ', '-')

    try:
        new_model_temp = my_image.model
    except AttributeError:
        new_model_temp = "NONE"
        
    new_model = new_model_temp.replace(' ', '-')

    new_name  = new_date + '_' + new_time + '-' + new_make + '-' +new_model
    new_JPG   = new_name + '.JPG'

    print (new_name)


    if (path.exists(new_name+'.JPG')):
            new_JPG = new_name+'-1.JPG'
            print (new_JPG+' exists')
    if (path.exists(new_name+'-1.JPG')):
            new_JPG = new_name+'-2.JPG'
            print (new_JPG+' exists')
    if (path.exists(new_name+'-2.JPG')):
            new_JPG = new_name+'-3.JPG'
            print (new_JPG+' exists')            
    if (path.exists(new_name+'-3.JPG')):
            new_JPG = new_name+'-4.JPG'
            print (new_JPG+' exists')
    if (path.exists(new_name+'-4.JPG')):
            new_JPG = new_name+'-5.JPG'
            print (new_JPG+' exists')
    if (path.exists(new_name+'-5.JPG')):
            new_JPG = new_name+'-6.JPG'
            print (new_JPG+' exists')            
            
    os.rename(my_photo, new_JPG)
    # image_file = close()
    



# my_photo = 'IMG_3758.JPG'
# move_photo(my_photo)

for source_dir in glob.glob("*/"):			# read the directories
    file_names = os.listdir(source_dir)
    
    for file_name in file_names:
        shutil.move(os.path.join(source_dir, file_name), './')

    try:
        os.rmdir(source_dir)
    except OSError as e:
        print("Error: %s : %s" % (source_dir, e.strerror))   


for file in glob.glob("*.*"):
    print (file)
    
    [filename, filetype] = file.split('.')
    print ("I got "+file+", it's a "+filetype+" file")

    if (filetype == 'JPG'):
        move_photo(file)
    elif (filetype == 'AAE'):
        os.remove(file)
    else:
        now=datetime.now()
        new_name = now.strftime("%Y%m%d_%H%M%S")+"-"+str(random.randint(1000, 9999))+"."+filetype
        os.rename(file, new_name)

    


print ('Done!')
