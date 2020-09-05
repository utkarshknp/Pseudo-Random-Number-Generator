% digital_communications_assignment
% Bipin_Kumar_170102021
% Utkarsh_Jaiswal_170102066
% Akhilesh_kumar_170102005
clc;
clear
clear all
close all;

total_bits=input('Desired number of Flip-Flops = \n');

while (1)
    sequence_complete=input('Enter sequence \n');
    [row,col]=size(sequence_complete);
    if col==total_bits
        break;
    end
    fprintf("wrong Sequence,Sequence length should be equal to number of FFs !\n");
end
dummy=sequence_complete;
sequence_complete(total_bits+1)=0;
sequence_complete=0;
    sequence_complete=dummy;
    tap_position=input('Enter tapping positions: \n');
    [tm,tapcolumn]=size(tap_position);
    x=tap_position(1);
    
    fprintf("--------------------------------------------------------\n");
    for i=1:((2^total_bits)-1)
       sequence_complete(2:(total_bits+1))=sequence_complete(1:(total_bits));
       xor_temporary=sequence_complete(x+1);
       for k=2:tapcolumn
           xor_temporary=xor(xor_temporary,sequence_complete(tap_position(k)+1));
       end
       sequence_complete(1)=xor_temporary;
       %sequence_complete(i)=sequence_complete(total_bits+1);
       fprintf("Sequence %d :=>",i);
        
       disp(sequence_complete(1:total_bits))
    end
    fprintf("--------------------------------------------------------\n");
    fprintf("Initial Sequence :=>");
        disp(dummy);
    if dummy(1:total_bits)==sequence_complete(1:total_bits)
       % fprintf("Tapping Positions are Optimal.\n");
       % disp(sequence_complete(1:total_bits));
       
    end
       

complete_sequence_dummy=sequence_complete(1:total_bits);
complete_sequence_dummy_again=sequence_complete(1:total_bits);
sequence_complete=sequence_complete(1:total_bits);
x=tap_position(1);
N=2^total_bits-1;
not_optimal=0;
max=-1;
enable=1;
cycle_length=N+1;
    for i=1:((2^total_bits)-1)
       sequence_complete(2:(total_bits+1))=sequence_complete(1:(total_bits));
       xor_temporary=sequence_complete(x+1);
       for k=2:tapcolumn
           xor_temporary=xor(xor_temporary,sequence_complete(tap_position(k)+1));
       end
       sequence_complete(1)=xor_temporary;      
       %disp(sequence_complete(1:total_bits))
       z=xor(dummy,sequence_complete(1:total_bits));
       [zm,zn]=size(z);
       sum=0;
       for k=1:zn    
          if z(k)==0
              sum=sum+1;
          end
       end
       value(i)=sum;
       if(sum>max)
           
           cycle_length=i;
           max=sum;
       end
       %fprintf("%d %d %d\n",sum,i,not_optimal);
    end
if(cycle_length~=N)
    fprintf("Tapping Positions are Not Optimal !\n\n"); 
else
    fprintf("Tapping Positions are Optimal \n\n"); 
end
fprintf("Cycle Length :=> %d\n\n",cycle_length); 
fprintf("Tapping Positions are :=> "); 
disp(tap_position);
fprintf("\n");
fprintf("\nCorrelation Matrix :=>\n");
ta=1:N;
grid on;
plot(ta,value);
grid on;
%in optimal condition graph will touch the peak only at the end of axis
axis([1 N 0 total_bits]);
disp(value);

