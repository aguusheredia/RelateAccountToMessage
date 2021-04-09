@IsTest global class Build {

		/*------------------------------------------------------------------------
	             AccountBuilderStart
	------------------------------------------------------------------------*/
	public class AccountBuilder {
		private Account obj = new Account(Name = 'STRING');

		 public Account build() {
			 return obj;
		}

	}

	public static AccountBuilder anAccount() { return new AccountBuilder(); }

	/*------------------------------------------------------------------------
	             AccountBuilderEnd
	------------------------------------------------------------------------*/

	/*------------------------------------------------------------------------
	             CaseBuilderStart
	------------------------------------------------------------------------*/
	public class CaseBuilder {
		private Case obj = new Case();

		public CaseBuilder withContactId(Contact value) {
			 obj.ContactId = value.Id;
			 return this;
		}

		public CaseBuilder withOwnerId(Group value) {
			 obj.OwnerId = value.Id;
			 return this;
		}
		public CaseBuilder withOwnerId(User value) {
			 obj.OwnerId = value.Id;
			 return this;
		}

		public CaseBuilder withRelatedCase(Case value) {
			 obj.RelatedCase__c = value.Id;
			 return this;
		}

		public CaseBuilder withResult(String value) {
			 obj.Result__c = value;
			 return this;
		}

		 public Case build() {
			 return obj;
		}

	}

	public static CaseBuilder aCase() { return new CaseBuilder(); }

	/*------------------------------------------------------------------------
	             CaseBuilderEnd
	------------------------------------------------------------------------*/
 
	/*------------------------------------------------------------------------
	             MessageBuilderStart
	------------------------------------------------------------------------*/
	public class MessageBuilder {
		private Message__c obj = new Message__c(Body__c = 'STRING');

		public MessageBuilder withBody(String value) {
			 obj.Body__c = value;
			 return this;
		}

		 public Message__c build() {
			 return obj;
		}

	}

	public static MessageBuilder aMessage() { return new MessageBuilder(); }

	/*------------------------------------------------------------------------
	             MessageBuilderEnd
	------------------------------------------------------------------------*/

	/*------------------------------------------------------------------------
	             AccountMessageAssociationBuilderStart
	------------------------------------------------------------------------*/
	public class AccountMessageAssociationBuilder {
		private AccountMessageAssociation__c obj = new AccountMessageAssociation__c();

		public AccountMessageAssociationBuilder withAccount(Account value) {
			 obj.Account__c = value.Id;
			 return this;
		}

		public AccountMessageAssociationBuilder withMessage(Message__c value) {
			 obj.Message__c = value.Id;
			 return this;
		}

		 public AccountMessageAssociation__c build() {
			 return obj;
		}

	}

	/** It require following fields to can be inserted: Account__c, Message__c. */
	public static AccountMessageAssociationBuilder anAccountMessageAssociation() { return new AccountMessageAssociationBuilder(); }

	/*------------------------------------------------------------------------
	             AccountMessageAssociationBuilderEnd
	------------------------------------------------------------------------*/

		/*------------------------------------------------------------------------
	             TaskBuilderStart
	------------------------------------------------------------------------*/
	public class TaskBuilder {
		private Task obj = new Task(Status = 'Not Started',
			Priority = 'High'
		);

		public TaskBuilder withWhoId(Contact value) {
			 obj.WhoId = value.Id;
			 return this;
		}
		public TaskBuilder withWhoId(Lead value) {
			 obj.WhoId = value.Id;
			 return this;
		}

		 public Task build() {
			 return obj;
		}

	}

	public static TaskBuilder aTask() { return new TaskBuilder(); }

	/*------------------------------------------------------------------------
	             TaskBuilderEnd
	------------------------------------------------------------------------*/
}