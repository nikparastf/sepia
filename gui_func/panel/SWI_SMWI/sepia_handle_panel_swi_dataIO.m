%% h = sepia_handle_panel_dataIO(hParent,h,position)
%
% Input
% --------------
% hParent       : parent handle of this panel
% hFig          : handle of the GUI
% h             : global structure contains all handles
% position      : position of this panel
%
% Output
% --------------
% h             : global structure contains all new and other handles
%
% Description: This GUI function creates a panel for I/O control
%
% Kwok-Shing Chan @ DCCN
% k.chan@donders.ru.nl
% Date created: 16 April 2018
% Date last modified: 30 May 2018
%
%
function h = sepia_handle_panel_swi_dataIO(hParent,h,position)

% define maximum level of options and spacing between options
nlevel = 5;
spacing = 0.02;
height = (1-(nlevel+1)*spacing)/nlevel;
bottom = (height+spacing:height+spacing:(height+spacing)*nlevel) - height;

% Parent of dataIO panel
h.swi.StepsPanel.dataIO = uipanel(hParent,'Title','I/O',...
    'Position',[position(1) position(2) 0.95 0.2],...
    'backgroundcolor',get(h.fig,'color'));

    % input 1
    h.swi.dataIO.text.inputData1 = uicontrol(h.swi.StepsPanel.dataIO,...
        'Style','text','String','Phase/QSM:',...
        'Units','normalized','Position', [0.01 bottom(5) 0.2 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'),...
        'tooltip','');
    h.swi.dataIO.edit.inputData1 = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','edit',...
        'units','normalized','position',[0.21 bottom(5) 0.68 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor','white');
    h.swi.dataIO.button.inputData1 = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','pushbutton','String','open',...
        'units','normalized','position',[0.89 bottom(5) 0.1 height],...
        'backgroundcolor','white');
    % input 2
    h.swi.dataIO.text.inputData2 = uicontrol(h.swi.StepsPanel.dataIO,...
        'Style','text','String','Magnitude:',...
        'Units','normalized','Position', [0.01 bottom(4) 0.2 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'),...
        'tooltip','');
    h.swi.dataIO.edit.inputData2 = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','edit',...
        'units','normalized','position',[0.21 bottom(4) 0.68 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor','white');
    h.swi.dataIO.button.inputData2 = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','pushbutton','String','open',...
        'units','normalized','position',[0.89 bottom(4) 0.1 height],...
        'backgroundcolor','white');
    % input 3
%     h.swi.dataIO.text.inputHeader = uicontrol(h.swi.StepsPanel.dataIO,...
%         'Style','text','String','Header:',...
%         'Units','normalized','Position', [0.01 button(3) 0.2 height],...
%         'HorizontalAlignment','left',...
%         'backgroundcolor',get(h.fig,'color'),...
%         'tooltip','');
%     h.swi.dataIO.edit.inputHeader = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
%         'Style','edit',...
%         'units','normalized','position',[0.21 button(3) 0.68 height],...
%         'HorizontalAlignment','left',...
%         'backgroundcolor','white');
%     h.swi.dataIO.button.inputHeader = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
%         'Style','pushbutton','String','open',...
%         'units','normalized','position',[0.89 button(3) 0.1 height],...
%         'backgroundcolor','white');
    
 


    % output basename
    h.swi.dataIO.text.output = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','text','String','Output basename:',...
        'units','normalized','Position',[0.01 bottom(1) 0.2 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'),...
        'tooltip','Output basename. Default output basename is the input directory followed by /output/squirrel');
    h.swi.dataIO.edit.output = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','edit',...
        'units','normalized','position',[0.21 bottom(1) 0.68 height],...
        'HorizontalAlignment','left',...
        'backgroundcolor','white');
    h.swi.dataIO.button.output = uicontrol('Parent',h.swi.StepsPanel.dataIO,...
        'Style','pushbutton','String','open',...
        'units','normalized','position',[0.89 bottom(1) 0.1 height],...
        'backgroundcolor','white');


%     % brain mask
%     h.dataIO.text.maskdir = uicontrol('Parent',h.StepsPanel.dataIO,...
%         'Style','text','String','Brain mask file:',...
%         'units','normalized','Position',[0.01 button(2) 0.2 height],...
%         'HorizontalAlignment','left',...
%         'backgroundcolor',get(h.fig,'color'),...
%         'tooltip','Specify mask file (NIfTI format). If the input directory contains NIfTI file with *mask* in the filename then it will be read automatically');
%     h.dataIO.edit.maskdir = uicontrol('Parent',h.StepsPanel.dataIO,...
%         'Style','edit',...
%         'units','normalized','position',[0.21 button(2) 0.68 height],...
%         'HorizontalAlignment','left',...
%         'backgroundcolor','white');
%     h.dataIO.button.maskdir = uicontrol('Parent',h.StepsPanel.dataIO,...
%         'Style','pushbutton','String','open',...
%         'units','normalized','position',[0.89 button(2) 0.1 height],...
%         'backgroundcolor','white');

%% set callback function
% open/edit pari
set(h.swi.dataIO.button.output,         	'Callback', {@ButtonOpen_swi_Callback,h,'output'});
% set(h.swi.dataIO.button.maskdir,          	'Callback', {@ButtonOpen_Callback,h,'mask'});
set(h.swi.dataIO.button.inputData1,         'Callback', {@ButtonOpen_swi_Callback,h,'inputdata1'});
set(h.swi.dataIO.button.inputData2,         'Callback', {@ButtonOpen_swi_Callback,h,'inputdata2'});
% set(h.swi.dataIO.button.inputHeader,        'Callback', {@ButtonOpen_swi_Callback,h,'header'});
    
end

function ButtonOpen_swi_Callback(source,eventdata,h,field)
% get directory and display it on GUI

% global h

% default output base name
prefix = 'Sepia';

switch field
    case 'mask'
        % only read NIfTI file for mask
        [maskfileName,pathDir] = uigetfile({'*.nii;*.nii.gz','NIfTI file (*.nii,*.nii.gz)'},'Select mask file');

        if pathDir ~= 0
            set(h.swi.dataIO.edit.maskdir,'String',fullfile(pathDir,maskfileName));
        end
        
        
    case 'output'
        
        % get directory for output
        pathDir = uigetdir;

        if pathDir ~= 0
            set(h.swi.dataIO.edit.output,'String',[pathDir prefix]);
        end
        
    case 'inputdata1'
        % only read NIfTI file for mask
        [fileName,pathDir] = uigetfile({'*.nii;*.nii.gz','NIfTI file (*.nii,*.nii.gz)'},'Select a NIfTI file');

        if pathDir ~= 0
            % set input edit field for display
            set(h.swi.dataIO.edit.inputData1,    'String',fullfile(pathDir,fileName));
            % automatically set default output field
            set(h.swi.dataIO.edit.output,   'String',[pathDir 'output' filesep prefix]);

        end
        
    case 'inputdata2'
        % only read NIfTI file for mask
        [fileName,pathDir] = uigetfile({'*.nii;*.nii.gz','NIfTI file (*.nii,*.nii.gz)'},'Select a NIfTI file');

        if pathDir ~= 0
            % set input edit field for display
            set(h.swi.dataIO.edit.inputData2,    'String',fullfile(pathDir,fileName));
            

        end
    
    case 'inputdata3'
        % only read NIfTI file for mask
        [fileName,pathDir] = uigetfile({'*.nii;*.nii.gz','NIfTI file (*.nii,*.nii.gz)'},'Select a NIfTI file');

        if pathDir ~= 0
            % set input edit field for display
            set(h.swi.dataIO.edit.inputData3,    'String',fullfile(pathDir,fileName));
            

        end
        
    case 'header'
        % only read NIfTI file for mask
        [fileName,pathDir] = uigetfile({'*.mat','QSM hub header file (*.mat)'},'Select a header file');

        if pathDir ~= 0
            % set input edit field for display
            set(h.swi.dataIO.edit.inputHeader,    'String',fullfile(pathDir,fileName));

        end
end

end