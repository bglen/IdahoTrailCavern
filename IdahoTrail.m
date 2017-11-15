clc
clear
%Music
%mudeth - Antibirth- OST - 15 Machine in the Walls.mp3
%mudeth - Anitbirth- OST - 05 Esc (Arcade).mp3
%mudeth - Antibirth- OST - 20 Subterranean Homesick Malign (Caves).mp3
% [a, fs] = audioread('mudeth - Antibirth- OST - 15 Machine in the Walls.mp3');
% song1 = audioplayer(a, fs);
% play(song1)

warning('off','all'); % turns off all warning messages

load Adventure
f1 = Start;
waitfor(f1)

f = figure('Name','Map');
Player = imread('Player.bmp');
Ogre = imread('Ogre.bmp');
Bandit = imread('Bandit.bmp');
SuperCola = imread('tea.bmp');
dUL = imread('dragon_upleft.bmp');
dUR = imread('dragon_upright.bmp');
dDR = imread('dragon_downright.bmp');
dDL = imread('dragon_downleft.bmp');
%Char= [Level EXP Vitality Strength Dexterity]
Char=[1 0 1 1 1];
Level=Char(1);
EXP=Char(2);
Vitality=Char(3);
Strength=Char(4);
Dexterity=Char(5);
Hero_Health=90+10*Vitality;

running = 1;
worldCount = 1;
posY = 1;
posX = 1;

%draw initial world
World{1,1}= Player;

World{7, 7} = dUL;
World{7, 8} = dUR;
World{8, 7} = dDL;
World{8, 8} = dDR;
for k=1:2
World{randi(9)+1,randi(9)+1}= Bandit;
World{randi(9)+1,randi(9)+1}= Ogre;
World{randi(9)+1,randi(9)+1}= SuperCola;
end
World{10,10}=Door;

%show inital world
imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);

%MAIN LOOP
while running == 1

%Check for Keyboard input
h = figure(1);
waitforbuttonpress;
switch get(h, 'CurrentKey')
    case 'rightarrow'
        if (posX + 1) <= 10
            World{posY,posX} = Blank;
            posX = posX + 1;
        end
    case 'downarrow'
        if (posY + 1) <= 10
            World{posY,posX} = Blank;
            posY = posY + 1;
        end
    case 'uparrow'
        if (posY - 1) >= 1
            World{posY,posX} = Blank;
            posY = posY - 1;
        end
    case'leftarrow'
        if (posX - 1) >= 1
            World{posY,posX} = Blank;
            posX = posX - 1;
        end
    case 'p'
        f3 = Pause;
        waitfor(f3);
end

%Interact with object in the world
if World{posY,posX} == Blank
    World{posY,posX} = Player;
elseif World{posY,posX} == Bandit
    [r] = BanditBattle(Strength,Dexterity,Hero_Health);
    Hero_Health=r;
    World{posY,posX} = Player;
    EXP=EXP + 1;
elseif World{posY,posX} == Ogre
    [d] = OgreBattle(Strength,Dexterity,Hero_Health);
    Hero_Health= d;
    EXP=EXP+3;
    World{posY,posX} = Player;
elseif World{posY,posX} == SuperCola
    EXP = EXP + (.5 * worldCount);
elseif World{posY,posX} == Door
    fprintf('Next Level!\n')
    %clear the level
    for x = 1:10
        for y = 1:10
            World{x, y} = Blank;
        end
    end
    
    %place new objects in the world
    World{1, 1} = Player;
    posX = 1;
    posY = 1;
    worldCount = worldCount + 1;
    for k=1:(4 * worldCount)
        World{randi(9)+1,randi(9)+1}= Bandit;
        World{randi(9)+1,randi(9)+1}= Ogre;
        World{randi(9)+1,randi(9)+1}= SuperCola;
    end
    World{10,10}=Door;
end

%display the world
World{posY,posX} = Player;
imshow([World{1,:};World{2,:};World{3,:};World{4,:};World{5,:};World{6,:};World{7,:};World{8,:};World{9,:};World{10,:};]);

%adjust stats for player
if (EXP >= 15) && (Level == 6)
        %Char= [Level EXP Vitality Strength Dexterity];
        Char(2)=EXP-15;
        Char(1)=7;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    elseif (EXP >= 12) && (Level == 5)
        Char(2)=EXP-12;
        Char(1)=6;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    elseif (EXP >= 9) && (Level == 4)
        Char(2)=EXP-9;
        Char(1)=5;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    elseif (EXP >= 6) && (Level == 3)
        Char(2)=EXP-6;
        Char(1)=4;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    elseif (EXP >= 3) && (Level == 2)
        Char(2)=EXP-3;
        Char(1)=3;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    elseif (EXP >= 2) && (Level == 1)
        Char(2)=EXP-2;
        Char(1)=2;
        [Char] = Levelsystem(Char);
        Level=Char(1);
        EXP=Char(2);
        Vitality=Char(3);
        Strength=Char(4);
        Dexterity=Char(5);
        Hero_Health=90+10*Vitality;
    else
    EXP=EXP;
    end

end
 pause(song1)
clear

