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

#import "ANInterstitialAdViewController.h"
#import "UIWebView+ANCategory.h"

@interface ANInterstitialAdViewController ()
@end

@implementation ANInterstitialAdViewController
@synthesize contentView = __contentView;

- (id)init
{
	self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
	return self;
}

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
	self.contentView.frame = CGRectMake((self.view.bounds.size.width - self.contentView.frame.size.width) / 2, (self.view.bounds.size.height - self.contentView.frame.size.height) / 2, self.contentView.frame.size.width, self.contentView.frame.size.height);
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	[UIView animateWithDuration:duration animations:^{
		self.contentView.frame = CGRectMake((self.view.bounds.size.width - self.contentView.frame.size.width) / 2, (self.view.bounds.size.height - self.contentView.frame.size.height) / 2, self.contentView.frame.size.width, self.contentView.frame.size.height);
	}];
}

- (void)setContentView:(UIView *)contentView
{
	if (contentView != __contentView)
	{
		if (contentView != nil)
		{
			if ([contentView isKindOfClass:[UIWebView class]])
			{
				[(UIWebView *)contentView removeDocumentPadding];
			}
			
			[self.view insertSubview:contentView belowSubview:self.closeButton];
		}
		
		[__contentView removeFromSuperview];
		
		if ([__contentView isKindOfClass:[UIWebView class]])
		{
			UIWebView *webView = (UIWebView *)__contentView;
			[webView setDelegate:nil];
			[webView stopLoading];
		}
		
		__contentView = contentView;
	}
}

- (IBAction)closeAction:(id)sender
{
	[self.delegate interstitialAdViewControllerShouldDismiss:self];
}

@end
