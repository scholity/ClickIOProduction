<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Created_Email</fullName>
        <description>B2C Commerce Cloud DISH Ticket Created Email</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_DISH_Ticket_Created_Email</template>
    </alerts>
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Declined</fullName>
        <description>B2C Commerce Cloud DISH Request Declined</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_Ticket_Declined</template>
    </alerts>
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Status_Awaiting_Response</fullName>
        <description>B2C Commerce Cloud DISH Ticket Status Marked Awaiting Response</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_DISH_Status_Awaiting_Requestor_Response</template>
    </alerts>
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_Awaiting_Approval</fullName>
        <description>B2C Commerce Cloud DISH Ticket Status marked &apos;Awaiting Approval&apos;</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_Ticket_Awaiting_Approval</template>
    </alerts>
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_complete</fullName>
        <description>B2C Commerce Cloud DISH Ticket Status marked complete</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_Ticket_Complete</template>
    </alerts>
    <alerts>
        <fullName>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_in_progress</fullName>
        <description>B2C Commerce Cloud DISH Ticket Status marked &apos;In Progress&quot;</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>paul.munn@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shweta.kohli@redcross.org</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Workflow_Templates/B2C_Commerce_Cloud_DISH_Ticket_Status_In_Progress</template>
    </alerts>
    <rules>
        <fullName>B2C Commerce Cloud DISH Ticket Created</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Created_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>B2C Commerce Cloud Ticket Awaiting Approval</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_Awaiting_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>B2C Commerce Cloud Ticket Complete</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>B2C Commerce Cloud Ticket Declined</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Declined</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Declined</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>B2C Commerce Cloud Ticket In Progress</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Status_marked_in_progress</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>B2C Commerce Cloud Ticket Status Awaiting Response</fullName>
        <actions>
            <name>B2C_Commerce_Cloud_DISH_Ticket_Status_Awaiting_Response</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B2CCommerceCloud_Internal_SF_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Awaiting Requester Response</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
