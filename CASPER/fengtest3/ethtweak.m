function ethtweak(sys)
  sw_ip_base  = hex2dec('0a0a0a20');
  sw_ip_step  = 8;
  gpu_ip_base = hex2dec('c0a80201');
  gpu_ip_step = 256;

  for k = 0:3
    sw_ip  = sw_ip_base  + k*sw_ip_step;
    gpu_ip = gpu_ip_base + k*gpu_ip_step;

    card_slot = floor(k/2);
    card_port_sw  = 2*mod(k,2);
    card_port_gpu = card_port_sw + 1;

    %% Set sw core paramters
    sw_blk = sprintf('%s/eth/%d/sw', sys, k);
    % Card slot
    set_param(sw_blk, 'slot', sprintf('%d', card_slot));
    % Card port
    set_param(sw_blk, 'port_r2_sfpp', sprintf('%d', card_port_sw));
    % MAC address
    set_param(sw_blk, 'fab_mac', sprintf('hex2dec(''0202%08x'')', sw_ip));
    % IP address
    set_param(sw_blk, 'fab_ip', sprintf('hex2dec(''%08x'')', sw_ip));

    %% Set gpu core parameters
    gpu_blk = sprintf('%s/eth/%d/gpu', sys, k);
    % Card slot
    set_param(gpu_blk, 'slot', sprintf('%d', card_slot));
    % Card port
    set_param(gpu_blk, 'port_r2_sfpp', sprintf('%d', card_port_gpu));
    % MAC address
    set_param(gpu_blk, 'fab_mac', sprintf('hex2dec(''0202%08x'')', gpu_ip));
    % IP address
    set_param(gpu_blk, 'fab_ip', sprintf('hex2dec(''%08x'')', gpu_ip));
  end
end
