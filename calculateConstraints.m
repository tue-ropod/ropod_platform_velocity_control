function [enable_local_robot, constraints_local_robot ] = calculateConstraints(ropod_kinmodel_param_vec, flock_control_mode, ena_sw)
Nwheels = length(ena_sw);

[  rW1_1,rW1_2,rW1_3,rW1_4,rW2_1,rW2_2,rW2_3,rW2_4,...
    s_w,...
    d_w, ...
    CW1_1,CW1_2,CW1_3,CW1_4,CW2_1,CW2_2,CW2_3,CW2_4 ...
    ]= extract_kinmodel_parameters(ropod_kinmodel_param_vec);

tau_max = 2.8; % These values should come from ropod_kin_param
rw = rW1_1;
% Conservtaive approach use only forward force of smartwheel, which is
% the smallest of all directions. In any case forces in other directions
% last little since the wheels will align in the direction of movement.

Fw_max = 2*tau_max/rw


CW = [[CW1_1 ; CW2_1], [CW1_2 ; CW2_2], [CW1_3 ; CW2_3], [CW1_4 ; CW2_4]];


%% First compute the matrix from v to W_wh

% Gi = zeros([2 3]);
G = zeros(2*Nwheels,3);
M = zeros(2*Nwheels,2*Nwheels);

for i=1:Nwheels    
    % To obtain pivot velocities in Robot coordinates, add vectors of
    % translations and movement due to angular velocity.
    Gi = [1 0 -CW(2,i);
                 0 1  CW(1,i)];             
    
    G(2*i-1:2*i,:) = Gi;    
    M(2*i-1:2*i,2*i-1:2*i)=diag([ena_sw(i) ena_sw(i)]);
end     

% Compute Force at pivots to actuate 1N in x at the ropod. Then scale up.

GtS = (M*G)'*eye(8);
sum(ena_sw)
if(flock_control_mode==0 || sum(ena_sw)<2)
    enable_local_robot = 0;
    Fx_max_ropod = 0;
    Fy_max_ropod = 0;    
else
    enable_local_robot = 1;
    Fpiv1Nx = pinv(GtS)*[1 0 0]';
    Fx_max_ropod = Fw_max/max(abs(Fpiv1Nx));
    Fpiv1Ny = pinv(GtS)*[0 1 0]';
    Fy_max_ropod = Fw_max/max(abs(Fpiv1Ny));    
end


% Eight elements with x,y position of constraint
constraints_local_robot = ...
    [
    Fx_max_ropod,   0, ...
    0,              Fy_max_ropod , ...
    -Fx_max_ropod,  0, ...
    0,             -Fy_max_ropod  ...
    ]';

end