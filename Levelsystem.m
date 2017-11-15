function [Char] = Levelsystem(Char)
    l = figure('Visible','off');
    %Char= [Level EXP Vitality Strength Dexterity];
    Level=Char(1);
    EXP=Char(2);
    Vitality=Char(3);
    Strength=Char(4);
    Dexterity=Char(5);
    
    
    txt = uicontrol('Style','text',...
        'Position',[50 250 450 80],...
        'FontName','Poor Richard',...
        'FontSize',15,...
        'String','You have leveled up!  Please pick an attribute to level up. You have also been fully healed');
    

    Vital = uicontrol('Style', 'pushbutton', 'String', 'Vitality +1',...
        'Position', [237 200 75 30],...
        'FontName','Poor Richard',...
        'FontSize',12,...
        'Callback', @Vitality1);       
    Stren = uicontrol('Style', 'pushbutton', 'String', 'Strength +1',...
        'Position', [237 160 75 30],...
        'FontName','Poor Richard',...
        'FontSize',12,...
        'Callback', @Strength1);
    Dext = uicontrol('Style', 'pushbutton', 'String', 'Dexterity +1',...
        'Position', [237 120 75 30],...
        'FontName','Poor Richard',...
        'FontSize',12,...
        'Callback', @Dexterity1);

					
    % Add a text uicontrol to label the slider.

    
    % Make figure visble after adding all components
    l.Visible = 'on';

    
    function [V] = Vitality1(~,~)
        Vitality = Vitality + 1;
        V=Vitality;
        delete(l)

    end
function [S]= Strength1(~,~)
        Strength = Strength + 1;
        S=Strength;
        delete(l)
end
function [D] = Dexterity1(~,~)
        Dexterity = Dexterity + 1;
        D=Dexterity;
        delete(l)
end

%     function surfzlim(source,event)
%         val = 51 - source.Value;
%         % For R2014a and earlier:
%         % val = 51 - get(source,'Value');
% 
%         zlim(ax,[-val val]);
%     end
waitfor(l)
Char= [Level EXP Vitality Strength Dexterity];

end