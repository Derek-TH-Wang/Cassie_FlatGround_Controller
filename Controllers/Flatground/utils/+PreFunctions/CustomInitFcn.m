PreFunctions.ParamInit;
PreFunctions.FilterInit;
UserParams.SampleTime = 1/2000;
% Create Data Bus
Data = PreFunctions.Construct_Data;
cassieDataBusInfo = Simulink.Bus.createObject(Data);
cassieDataBus = eval(cassieDataBusInfo.busName);

% Create GaitLibrary Bus
GL = load('GaitLibrary_2D_Velocity_FootHeight_v1.mat');  % desired trajectories

% [0 0 -9.80665]
% GL = load('GL_PD_BO9_v1F.mat'); % actual trajectories
GaitLibrary = GL.GaitLibrary_output;
cassieGaitLibraryBusInfo = Simulink.Bus.createObject(GaitLibrary);
cassieGaitLibraryBus = eval(cassieGaitLibraryBusInfo.busName);

fname = which('all_buses.m');
delete(fname)
Simulink.Bus.save([root_dir '\all_buses.m'])