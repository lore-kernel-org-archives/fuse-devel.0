Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209311;
	b=vVlp6tILpeLNFBNZ9Di0byQHCZBLN1tNrLnj0ji+XZwLRNsCYi/VfhMO6DUTgCcv+oJ8
	 nRO2pitWiAjmsiJ0o08Zok5zAZ7r4Wh7kMz03hsXoJH5RANTQ+qYGGOO+55oQLf+J/1yi
	 zCYbxTnIC3vsnC179ahy8YW9gxLIFEt5anidNOrG57RQGYp1nbO0GNtSXrO2NVZxTQrqQ
	 72VCbCf2xvUx6lPkLoa2WE5uOXTQ9IEx7D7gPT7mU/KHRc2h3kNsuUmgmBJEFVfGgcUZJ
	 E1djm/xFfm+Jw+DHya+RLjuFMxKKitK0s95w9bIu5tc7bIgo7NxuUSpyxspMnJ+06mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209311;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Pv8q17yADd4NeIA5cXR87RgzDtmfCEz270D6vwEmXW4=;
	b=Sa8HMfP6myRQ7xtvfrhYW+F2kazAsgVxfOnHpB9m7itDro7OzD4namCwwbxbuFTgIY/L
	 0mP7l6ooS4pOt2tvBuzvEwU60hYG4PqtmuIY12uBLBhBDgqWBQIR9rPdkSxIoHmdKm3Je
	 8V25NV9hjNcCuV46xWzVlBwY8/Uftd80om8p2g6T/D+U4JVdQNx1ax8CCrU/qnLkURX2Z
	 qo3lPtfnMZ4aEJuj8AZIyKNV04gps0GKr1dX3Plv2ogRpCzoO1jb0BK1fBtLHQQOG4Lun
	 L+rESEit1kCM0asYuYrJPSAbtSZE11ARsrkDzvsheTQu7tjzZwIsAxBWqNGX3H4vqNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYeGstEZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280AC606A6A6;
	Fri, 20 Nov 2026 21:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CYeGstEZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452D01F000C6;
	Fri, 20 Nov 2026 21:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795209310;
	bh=Pv8q17yADd4NeIA5cXR87RgzDtmfCEz270D6vwEmXW4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CYeGstEZw/ME3LNV6TLwJwg97MswSZVxn3aFStNyvWqS46oP2SgUIF87Ge3+7FF74
	 F2FwSz+zr3fVsDfwxNZKPXX4e52lThIOVGumZl4WqHvmJ4Bp9B9mN9WzY0nJSL1f0+
	 C0xJsc+gmYysQMP7FVpvGdgG4ke+ejURq+dxFUT4dfgpm4eCxm+CcE0AouWqHgh9S+
	 ftC/B5Uq9l2Z/nelIPU3fbERK/1Y+zg7CS13rA3GV5rgs0KvLCkCieSUYaDnOSEtgF
	 KrV6WM/8QldoDf54tIvOLPJd1NcwmvE1qOOm9aYqsJU8B9kA246eSKWPfF2xzOAigm
	 le4sajtBqiMtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A527380A964;
	Fri, 20 Nov 2026 21:15:10 +0000 (UTC)
Subject: Re: [GIT PULL] fuse fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAJfpegvzVm6hTTNp7BgkFMs1DziFvmNoHUXjdTPz=9nC5ccUjQ@mail.gmail.com>
References: <CAJfpegvzVm6hTTNp7BgkFMs1DziFvmNoHUXjdTPz=9nC5ccUjQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAJfpegvzVm6hTTNp7BgkFMs1DziFvmNoHUXjdTPz=9nC5ccUjQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git tags/fuse-fixes-7.4-rc4
X-PR-Tracked-Commit-Id: 7f7b822d09c5590defcc61a37ffbd5a3533ed518
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f22fb20497f4983094131f00a734362300d22d2
Message-Id: <179520930874.792202.7768867709024262369.pr-tracker-bot@kernel.org>
Date: Fri, 20 Nov 2026 21:15:08 +0000
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, fuse-devel <fuse-devel@lists.linux.dev>, linux-kernel@vger.kernel.org
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Fri, 20 Nov 2026 16:16:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git tags/fuse-fixes-7.4-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f22fb20497f4983094131f00a734362300d22d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
