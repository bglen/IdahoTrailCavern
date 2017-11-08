clear
clc
%Music
%mudeth - Antibirth- OST - 15 Machine in the Walls.mp3
%mudeth - Anitbirth- OST - 05 Esc (Arcade).mp3
%mudeth - Antibirth- OST - 20 Subterranean Homesick Malign (Caves).mp3
%[a, fs] = audioread('mudeth - Antibirth- OST - 15 Machine in the Walls.mp3');
%song1 = audioplayer(a, fs);
%play(song1)

warning('off','all'); % turns off all warning messages


load Adventure
%Player = imread('Player.bmp');
running = 1;
posX = 1;
posY = 1;
World{1,1}= Player;
imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);


for k= 1:19
h = figure(1);
waitforbuttonpress;
switch get(h, 'CurrentKey')
    case 'rightarrow'
        World{posX,posY} = Blank;
        posY = posY + 1;
        World{posX,posY} = Player;
        imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);
    case 'downarrow'
        World{posX,posY} = Blank;
        posX = posX + 1;
        World{posX,posY} = Player;
        imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);
    case 'uparrow'
        World{posX,posY} = Blank;
        posX = posX - 1;
        World{posX,posY} = Player;
        imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);
    case 'leftarrow'
        World{posX,posY} = Blank;
        posY = posY - 1;
        World{posX,posY} = Player;
        imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);
    
    
    
end
end
% <- arrow
pause(song1)

    %ESCAPE to end game/return to home menu
    
    
    %move enemies
    imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);
clear
