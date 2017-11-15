function [r] = BanditBattle(Strength,Dexterity,Hero_Health)
% Fight with bandit
%define variables and initial plot type
f2 = figure('Visible','off',...
    'Name','BanditBattle');
ax = axes('Units','pixels','Position',[35,110,500,300]);

Hero_Atk_DMG=1+Strength;
Dodge_Chance=0.75+0.02*Dexterity;
Sword_Atk_DMG=Hero_Atk_DMG+20*(Strength*0.10+1);
Sheild_Block=randi(10)*.01+0.90;
Bandit_Health=90+randi(20);
Bandit_Atk=8+randi(6);
turn=1;
x(turn)=turn;
Hero(turn)=Hero_Health;
x1(turn)=turn;
Bandit(turn)=Bandit_Health;
stairs(x,Hero, 'LineWidth', 2)
hold on
stairs(x1,Bandit)
ylim([0 110])
% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Attack',...
    'Position', [70 60 50 20],...
    'Callback', @Attack);
% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Dodge',...
    'Position', [70 40 50 20],...
    'Callback', @Dodge);
% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'Block',...
    'Position', [70 20 50 20],...
    'Callback', @Block);
% Add a text uicontrol to label.
Action = uicontrol('Style','text',...
    'Position',[20 40 50 20],...
    'String','Action');
Description = uicontrol('Style','text',...
    'Position',[150 40 250 40],...
    'FontName','Poor Richard',...
    'FontSize',12,...
    'String','You encounter a blood thirsty Bandit. You sense he is in a rage');
txt = uicontrol('Style','text',...
    'Position',[460 45 40 20],...
    'String','Health:');
txt1 = uicontrol('Style','text',...
    'Position',[500 45 30 20],...
    'String',Hero_Health);
txt2 = uicontrol('Style','text',...
    'Position',[428 65 72 20],...
    'String','Enemy Health:');
txt3 = uicontrol('Style','text',...
    'Position',[500 65 30 20],...
    'String',Bandit_Health);

% Make figure visble after adding all components
f2.Visible = 'on';
% This code uses dot notation to set properties.
% Dot notation runs in R2014b and later.
% For R2014a and earlier: set(f,'Visible','on');

    function Attack(~,~)
        if Bandit_Health > 0
            Bandit_Atk=8+randi(6);
        else
            Bandit_Atk=0;
        end
        Bandit_Health= Bandit_Health - Sword_Atk_DMG;
        Hero_Health = Hero_Health - Bandit_Atk;
        turn= turn+1;
        x(turn)=turn;
        Hero(turn)=Hero_Health;
        x1(turn)=turn;
        Bandit(turn)=Bandit_Health;
        stairs(x,Hero, 'LineWidth', 3)
        stairs(x1,Bandit)
        txt1.String = Hero_Health;
        txt3.String = Bandit_Health;
        if Bandit_Health > 50
            Description.String = "The two of you exhange blows, He doesn't seem too let up";
        elseif (Bandit_Health <= 15) < (Bandit_Health <= 50)
            Description.String = 'He seems weak!';
        elseif (Bandit_Health <= 0) < (Bandit_Health <= 15)
            Description.String = 'Th bandit coughs up blood';
        else Bandit_Health <= 0;
            Description.String = 'The bandit has died';
            
        end
    end
    function Dodge(~,~)
        if Bandit_Health > 0
            Bandit_Atk=8+randi(6);
        else
            Bandit_Atk=0;
        end
        Dodge_Barrier=rand();
        if Dodge_Barrier < Dodge_Chance
            Bandit_Health;
            Hero_Health;
            Description.String = 'You successfully dodged his slash';
        else
            Hero_Health= Hero_Health - Bandit_Atk;
            Bandit_Health;
            Description.String = 'You were too late! He lands a blow!';
        end
        turn= turn+1;
        x(turn)=turn;
        Hero(turn)=Hero_Health;
        x1(turn)=turn;
        Bandit(turn)=Bandit_Health;
        stairs(x,Hero, 'LineWidth', 3)
        stairs(x1,Bandit)
        txt1.String = Hero_Health;
    end
    function Block(~,~)
        if Bandit_Health > 0
            Bandit_Atk=8+randi(6);
        else
            Bandit_Atk=0;
        end
        Bandit_Health;
        Hero_Health= Hero_Health - Bandit_Atk*(1-Sheild_Block);
        turn= turn+1;
        x(turn)=turn;
        Hero(turn)=Hero_Health;
        x1(turn)=turn;
        Bandit(turn)=Bandit_Health;
        stairs(x,Hero, 'LineWidth', 3)
        stairs(x1,Bandit)
        txt1.String = Hero_Health;
        
    end

    waitfor(f2)
    r=Hero_Health;
end
