classdef EXP3<handle
    % EXP 3 strategy for one player
    
    properties
        nbActions
        eta % learning rate
        beta % exploration parameter
        w 
        lastAction
    end
    
    methods
        
        function self = EXP3(eta,beta,nbActions)
            self.nbActions=nbActions;
            self.eta=eta;
            self.beta=beta;
            self.w=ones(1,nbActions);
        end
        
        function self = init(self)
            self.w=ones(1,self.nbActions);
        end
        
        function [action] = play(self)
            % chooses the next action
            p=(1-self.eta)*self.w/sum(self.w)+self.eta/self.nbActions;
            action=simu(p);
            self.lastAction=action;
        end
        
        function self = getReward(self,r)
            % r the last rewards recieved by A
            p=(1-self.eta)*self.w/sum(self.w)+self.eta/self.nbActions;
            X=self.beta*ones(1,self.nbActions)./p;
            X(self.lastAction)=X(self.lastAction)+r;
            self.w=self.w.*exp(self.eta*X);
         end
                
    end    
end
