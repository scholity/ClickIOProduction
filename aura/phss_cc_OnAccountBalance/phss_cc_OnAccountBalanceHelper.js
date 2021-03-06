({  
    showToastMessage: function (header, message, type) {
        var toastEvent = $A.get('e.force:showToast');
        toastEvent.setParams({
            title: header,
            message: message,
            type: type
        });
        toastEvent.fire();
    },

    getStoredPayments: function (component, event, helper) {
        component.set('v.renderComplete', false);
        var opportunitySfid = component.get('v.currOpportunitySfid');
        var action = component.get('c.fetchStoredPayments');
        action.setParams({
            opportunitySfid: opportunitySfid
        });
        action.setCallback(this, function (response) {
            var state = response.getState();

            if (state === 'SUCCESS') {
                var returnValue = response.getReturnValue();
                
                console.log(returnValue);
                

                if (returnValue != null && returnValue.Error == null) {
                    component.set('v.storedPaymentList',returnValue);
                    //console.log("returnValue.name***"+returnValue.name);
                    //component.set('v.storedPaymentMap',returnValue.storedPaymentMap);
                    component.set('v.listUpdate',true);
                    component.set('v.renderComplete', true);
                } else if (returnValue != null && returnValue.Error != null) {
                    this.showToastMessage('Error Fetching Cart', returnValue.Error, 'Error')
                }
            } else {
                this.showToastMessage('Error Fetching Cart', 'Unable to contact server.', 'Error');
            }
            component.set('v.showSpinner', false);
        });
        component.set('v.showSpinner', true);
        $A.enqueueAction(action);
    },

    getDateFromString : function(s) {
        if (s != undefined && s !== '') {
            var components = s.split('-');
            if (components.length == 3) {
                var year = parseInt(components[0]);
                var month = parseInt(components[1]) - 1;
                var day = parseInt(components[2]);
                var d = new Date(year, month, day);
                return d;
            }
        }
        return null;
    },

})