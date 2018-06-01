%% h = qsmhub_handle_panel_qsm_MEDI(hParent,h,position)
%
% Input
% --------------
% hParent       : parent handle of this panel
% h             : global structure contains all handles
% position      : position of this panel
%
% Output
% --------------
% h             : global structure contains all new and other handles
%
% Description: This GUI function creates a panel for FANSI method
%
% Kwok-shing Chan @ DCCN
% k.chan@donders.ru.nl
% Date created: 1 June 2018
% Date last modified: 
%
%
function h = qsmhub_handle_panel_qsm_MEDI(hParent,h,position)

%% Parent handle of MEDI panel children

h.qsm.panel.MEDI = uipanel(hParent,...
    'Title','Morphology-enabled dipole inversion (MEDI+0)',...
    'position',position,...
    'backgroundcolor',get(h.fig,'color'),'Visible','off');

%% Children of MEDI panel
    
    % text|edit field pair: regularisation parameter
    h.qsm.MEDI.text.lambda = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','text',...
        'String','lambda:',...
        'units','normalized','position',[0.01 0.75 0.2 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.lambda = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','edit',...
        'String','1000',...
        'units','normalized','position',[0.25 0.75 0.2 0.2],...
        'backgroundcolor','white');

    % text|edit field pair: size of zero padding
    h.qsm.MEDI.text.zeropad = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','text',...
        'String','Zeropad:',...
        'units','normalized','position',[0.5 0.75 0.2 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.zeropad = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','edit',...
        'String','0',...
        'units','normalized','position',[0.75 0.75 0.2 0.2],...
        'backgroundcolor','white');

    % text|edit field pair: weighting of phase data
    h.qsm.MEDI.text.weightData = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','text',...
        'String','Data weight:',...
        'units','normalized','position',[0.01 0.5 0.2 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.weightData = uicontrol('Parent',h.qsm.panel.MEDI,...
        'Style','edit',...
        'String','1',...
        'units','normalized','position',[0.25 0.5 0.2 0.2],...
        'backgroundcolor','white');

    % text|edit field pair: weighting of gradient of magnitude data
    h.qsm.MEDI.text.weightGradient = uicontrol('Parent',h.qsm.panel.MEDI,'Style','text',...
        'String','Gradient weight:',...
        'units','normalized','position',[0.5 0.5 0.24 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.weightGradient = uicontrol('Parent',h.qsm.panel.MEDI,'Style','edit',...
        'String','1',...
        'units','normalized','position',[0.75 0.5 0.2 0.2],...
        'backgroundcolor','white');

    % checkbox|edit field pair: SMV size
    h.qsm.MEDI.checkbox.smv = uicontrol('Parent',h.qsm.panel.MEDI,'Style','checkbox',...
        'String','SMV, radius',...
        'units','normalized','position',[0.01 0.25 0.24 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.smv_radius = uicontrol('Parent',h.qsm.panel.MEDI,'Style','edit',...
        'String','5',...
        'units','normalized','position',[0.25 0.25 0.2 0.2],...
        'backgroundcolor','white','enable','off');

    % checkbox: Merit
    h.qsm.MEDI.checkbox.merit = uicontrol('Parent',h.qsm.panel.MEDI,'Style','checkbox',...
        'String','Merit',...
        'units','normalized','position',[0.5 0.25 0.24 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));

    % checkbox|edit field pair: regulariation of CSF
    h.qsm.MEDI.checkbox.lambda_csf = uicontrol('Parent',h.qsm.panel.MEDI,'Style','checkbox',...
        'String','Lambda CSF:',...
        'units','normalized','position',[0.01 0.01 0.24 0.2],...
        'HorizontalAlignment','left',...
        'backgroundcolor',get(h.fig,'color'));
    h.qsm.MEDI.edit.lambda_csf = uicontrol('Parent',h.qsm.panel.MEDI,'Style','edit',...
        'String','100',...
        'units','normalized','position',[0.25 0.01 0.2 0.2],...
        'backgroundcolor','white','enable','off');

end