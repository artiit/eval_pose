% LSP joint
% 1	Right ankle
% 2	Right knee
% 3	Right hip
% 4	Left hip
% 5	Left knee
% 6	Left ankle
% 7	Right wrist
% 8	Right elbow
% 9	Right shoulder
% 10	Left shoulder
% 11	Left elbow
% 12	Left wrist
% 13	Neck
% 14	Head top
startup;

reference_joints_pair = [3, 10];     % right shoulder and left hip (from observer's perspective)
% symmetry_joint_id(i) = j, if joint j is the symmetry joint of i (e.g., the left
% shoulder is the symmetry joint of the right shoulder).
symmetry_joint_id = [6,5,4,3,2,1,12,11,10,9,8,7,14,13];
joint_name = {'Ankle', 'Knee', 'Hip', 'Wris', 'Elbo', 'Shou', 'Head'};

% symmetry_part_id(i) = j, if part j is the symmetry part of i (e.g., the left
% upper arm is the symmetry part of the right upper arm).
symmetry_part_id = [4,3,2,1,8,7,6,5,9,10];
part_name = {'L.legs', 'U.legs', 'L.arms', 'U.arms', 'Head', 'Torso'};
% %% Evaluate LSP (Observer Centric)
% load('gt/lsp-joints-OC.mat', 'joints');
% joints = joints(1:2,:,1001:end);
% eval_name = 'LSP-OC';
% 
% % eval PCP
% load('gt/lsp-joints-OC.mat', 'joints');
% joints = joints(1:2,:,1001:end);
% eval_pcp(joints, joints, symmetry_part_id, part_name, eval_name);
% 
% % eval PCK
% load('gt/lsp-joints-OC.mat', 'joints');
% joints = joints(1:2,:,1001:end);
% eval_pck(joints, joints, symmetry_joint_id, joint_name, eval_name);
% 
% % eval PDJ
% eval_pdj(joints, joints, reference_joints_pair, symmetry_joint_id, joint_name, eval_name);

%% Evaluate LSP (Person Centric)
eval_name = 'LSP-PC';
% load('/home/ai/data/heatmap_data/lsp/test/joints.mat', 'joints_test');
% joints_test = permute(joints_test,[2 1 3]);

load('/home/ai/code/caffe-heatmap/matlab/pose/lsplabel.mat', 'labels'); % load original parse labels
joints_test = labels;

%eval PCP
load('/home/ai/code/caffe-heatmap/matlab/pose/lsp_1.mat','joints');
%joint = zeros(2,14,1000);
% %transpose the order of the pred joints.
% joint(:,1,:) = joints(:,13,:);joint(:,2,:) = joints(:,11,:);
% joint(:,3,:) = joints(:,9,:);joint(:,4,:) = joints(:,10,:);
% joint(:,5,:) = joints(:,12,:);joint(:,6,:) = joints(:,14,:);
% joint(:,7,:) = joints(:,7,:);joint(:,8,:) = joints(:,5,:);
% joint(:,9,:) = joints(:,3,:);joint(:,10,:) = joints(:,4,:);
% joint(:,11,:) = joints(:,6,:);joint(:,12,:) = joints(:,8,:);
% joint(:,13,:) = joints(:,2,:);joint(:,14,:) = joints(:,1,:);


pred = joints;

% 
if 0
load('gt/lsp-joints-PC.mat', 'joints');
joints_test = joints(1:2,:,1001:end);
load('/home/ai/data/pred_keypoints_lsp_pc.mat','pred');
eval_name = 'LSP-PC';
end

eval_pcp(pred, joints_test, symmetry_part_id, part_name, eval_name);

% eval PCK
eval_pck(pred, joints_test, symmetry_joint_id, joint_name, eval_name);

% eval PDJ
%eval_pdj(pred, joints_test, reference_joints_pair, symmetry_joint_id, joint_name, eval_name);
