"
Checks for the common code fragment: ""(aCollection detect: [:each | ''some condition''] ifNone: [nil]) ~= nil"". contains: can simplify this code to ""aCollection contains: [:each | ''some condition'']"". Not only is the contains: variant shorter, it better signifies what the code is doing
"
Class {
	#name : #ReContainsRule,
	#superclass : #ReNodeMatchRule,
	#category : #'GeneralRules-Migrated'
}

{ #category : #accessing }
ReContainsRule class >> uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'ContainsRule'
]

{ #category : #accessing }
ReContainsRule >> group [
	^ 'Optimization'
]

{ #category : #initialization }
ReContainsRule >> initialize [
	super initialize.
	self matchesAny: #(
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) isNil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) notNil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) = nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) == nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) ~= nil'
			'(`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [nil]) ~~ nil'
			'`@object detect: [:`each | | `@temps| `@.Statements] ifNone: [| `@temps1 | `@.Statements2. ^`@anything]' )
]

{ #category : #accessing }
ReContainsRule >> name [
	^ 'Uses detect:ifNone: instead of contains:'
]

{ #category : #accessing }
ReContainsRule >> rationale [
	^ 'Checks for the common code fragment: "(aCollection detect: [:each | ''some condition''] ifNone: [nil]) ~= nil".'
]
