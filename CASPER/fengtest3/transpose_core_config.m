function transpose_core_config(this_block)

  % Revision History:
  %
  %   22-Jul-2013  (16:20 hours):
  %     Original code was machine generated by Xilinx's System Generator after parsing
  %     /tools/designs/CASPER/projects/paper/roachfengine/transpose_core.vhd
  %
  %

  this_block.setTopLevelLanguage('VHDL');

  this_block.setEntityName('transpose_core');

  % System Generator has to assume that your entity  has a combinational feed through; 
  %   if it  doesn't, then comment out the following line:
  %this_block.tagAsCombinational;

  this_block.addSimulinkInport('sync');
  this_block.addSimulinkInport('din');
  this_block.addSimulinkInport('fid');
  this_block.addSimulinkInport('tid');
  this_block.addSimulinkInport('mode');

  this_block.addSimulinkOutport('dout');
  this_block.addSimulinkOutport('valid');
  this_block.addSimulinkOutport('dest');
  this_block.addSimulinkOutport('eof');

  dest_port = this_block.port('dest');
  dest_port.setType('UFix_8_0');
  dout_port = this_block.port('dout');
  dout_port.setType('UFix_64_0');
  eof_port = this_block.port('eof');
  eof_port.setType('UFix_1_0');
  eof_port.useHDLVector(false);
  valid_port = this_block.port('valid');
  valid_port.setType('UFix_1_0');
  valid_port.useHDLVector(false);

  % -----------------------------
  if (this_block.inputTypesKnown)
    % do input type checking, dynamic output type and generic setup in this code block.

    if (this_block.port('din').width ~= 128);
      this_block.setError('Input data type for port "din" must have width=128.');
    end

    if (this_block.port('fid').width ~= 3);
      this_block.setError('Input data type for port "fid" must have width=3.');
    end

    if (this_block.port('sync').width ~= 1);
      this_block.setError('Input data type for port "sync" must have width=1.');
    end

    this_block.port('sync').useHDLVector(false);

    if (this_block.port('tid').width ~= 2);
      this_block.setError('Input data type for port "tid" must have width=2.');
    end

    if (this_block.port('mode').width ~= 2);
      this_block.setError('Input data type for port "mode" must have width=2.');
    end

  end  % if(inputTypesKnown)
  % -----------------------------

  % -----------------------------
   if (this_block.inputRatesKnown)
     setup_as_single_rate(this_block,'clk_1','ce_1')
   end  % if(inputRatesKnown)
  % -----------------------------

    % (!) Set the inout port rate to be the same as the first input 
    %     rate. Change the following code if this is untrue.
    uniqueInputRates = unique(this_block.getInputRates);


  % Add addtional source files as needed.
  %  |-------------
  %  | Add files in the order in which they should be compiled.
  %  | If two files "a.vhd" and "b.vhd" contain the entities
  %  | entity_a and entity_b, and entity_a contains a
  %  | component of type entity_b, the correct sequence of
  %  | addFile() calls would be:
  %  |    this_block.addFile('b.vhd');
  %  |    this_block.addFile('a.vhd');
  %  |-------------

  %    this_block.addFile('');
  %    this_block.addFile('');
  this_block.addFile('transpose_core.vhd');

return;


% ------------------------------------------------------------

function setup_as_single_rate(block,clkname,cename) 
  inputRates = block.inputRates; 
  uniqueInputRates = unique(inputRates); 
  if (length(uniqueInputRates)==1 & uniqueInputRates(1)==Inf) 
    block.addError('The inputs to this block cannot all be constant.'); 
    return; 
  end 
  if (uniqueInputRates(end) == Inf) 
     hasConstantInput = true; 
     uniqueInputRates = uniqueInputRates(1:end-1); 
  end 
  if (length(uniqueInputRates) ~= 1) 
    block.addError('The inputs to this block must run at a single rate.'); 
    return; 
  end 
  theInputRate = uniqueInputRates(1); 
  for i = 1:block.numSimulinkOutports 
     block.outport(i).setRate(theInputRate); 
  end 
  block.addClkCEPair(clkname,cename,theInputRate); 
  return; 

% ------------------------------------------------------------
