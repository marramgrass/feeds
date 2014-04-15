//
//  AsanaAccount.m
//  Feeds
//
//  Created by Mark Goody on 15/04/2014.
//  Copyright (c) 2014 Spotlight Mobile. All rights reserved.
//

#import "AsanaAccount.h"

NSString * const kAsanaAPIBaseURL = @"https://app.asana.com/api/1.0";

@implementation AsanaAccount

+ (void)load { [Account registerClass:self]; }
+ (BOOL)requiresUsername { return YES; }
+ (NSString *)usernameLabel { return @"API Key"; }

- (void)validateWithPassword:(NSString *)password {
	NSURL *URL = [NSURL URLWithString:[self apiUrlStringWithPath:@"/users/me"]];
	NSMutableURLRequest *URLRequest = [NSMutableURLRequest requestWithURL:URL
																 username:self.username
																 password:@""];

	self.request = [SMWebRequest requestWithURLRequest:URLRequest delegate:nil context:NULL];

}

- (void)authorizationSuccessful:(NSData *)data password:(NSString *)password {

}

- (void)authorizationFailedWithError:(NSError *)error {

}

#pragma mark - Asana URLs
- (NSString *)apiUrlStringWithPath:(NSString *)targetPath
{
	NSString *format = @"%@%@";

	#if DEBUG
	format = @"%@%@?opt_pretty";
	#endif

	return [NSString stringWithFormat:format, kAsanaAPIBaseURL, targetPath];
}

@end
