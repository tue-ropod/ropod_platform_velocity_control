close all;
clearvars

load w_plarform_sp.mat
% load varphi_tau_setp.mat
% load varphi_tau_setp_distr.mat
% load varphi_tau_setp_fcomp.mat
% load varphi_tau_setp_vel_cntr.mat
% load delta_meas.mat
% load ../Test_tuned_cntr_1_2ms/varphi_tau_setp_kincntr.mat
% load ../Test_tuned_cntr_1_2ms/varphi_tau_setp_Platf_kincntr.mat
% load ../Test_tuned_cntr_1_2ms/dqr_loc_meas.mat
% load ../Test_tuned_cntr_1_2ms/dqr_loc_sp.mat
% load ../Test_tuned_cntr_1_2ms/delta_meas.mat
load ext_agent_conf_in.mat
load length_ext_agent_conf_in.mat
load ext_agent_conf_out.mat
load w_agents_sp.mat

% varphi_tau_setp = varphi_tau_setp';
w_plarform_sp = w_plarform_sp';
% varphi_tau_setp_distr = varphi_tau_setp_distr';
% varphi_tau_setp_fcomp = varphi_tau_setp_fcomp';
% varphi_tau_setp_vel_cntr =varphi_tau_setp_vel_cntr';
% delta_meas =delta_meas';
length_ext_agent_conf_in=length_ext_agent_conf_in';
ext_agent_conf_in=ext_agent_conf_in';
ext_agent_conf_out=ext_agent_conf_out';
w_agents_sp = w_agents_sp';

figure
plot(w_plarform_sp(:,1),w_plarform_sp(:,2:end))
% 
% figure
% subplot(221)
% plot(varphi_tau_setp(:,1),varphi_tau_setp(:,2:end))
% subplot(222)
% plot(varphi_tau_setp_vel_cntr(:,1),varphi_tau_setp_vel_cntr(:,2:end))
% subplot(223)
% plot(varphi_tau_setp_distr(:,1),varphi_tau_setp_distr(:,2:end))
% subplot(224)
% plot(varphi_tau_setp_fcomp(:,1),varphi_tau_setp_fcomp(:,2:end))

% figure
% plot(delta_meas(:,1),delta_meas(:,2:end))

figure
subplot(121)
plot(ext_agent_conf_in(:,1),ext_agent_conf_in(:,2:end))
subplot(122)
plot(ext_agent_conf_out(:,1),ext_agent_conf_out(:,2:end))
figure
plot(w_agents_sp(:,1),w_agents_sp(:,2:end))


