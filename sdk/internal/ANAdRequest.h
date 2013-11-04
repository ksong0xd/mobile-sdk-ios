/*   Copyright 2013 APPNEXUS INC
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "ANLocation.h"
#import "ANAdProtocol.h"

@interface ANAdRequest : NSObject

@property (nonatomic, readwrite, strong) NSString *placementId;
@property (nonatomic, readwrite, assign) BOOL shouldServePublicServiceAnnouncements;
@property (nonatomic, readwrite, assign) BOOL clickShouldOpenInBrowser;
@property (nonatomic, readwrite, strong) ANLocation *location;
@property (nonatomic, readwrite, assign) CGSize adSize;
@property (nonatomic, readwrite, assign) CGSize maxSize;
@property (nonatomic, readwrite, assign) CGFloat reserve;
@property (nonatomic, readwrite, strong) NSString *age;
@property (nonatomic, readwrite, assign) ANGender gender;
@property (nonatomic, readwrite, strong) NSMutableDictionary *customKeywords;

- (NSString *)getRequestUrlString;

@end
