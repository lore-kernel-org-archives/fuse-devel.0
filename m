Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897224;
	b=4MUdjDw550OWzpJViH0cNJza2WQyt0sZL3b4nKvoipsnTPZJi5/H8vvB9iC2QfapAXr5
	 awmSN/S0KIjuLTEwGo37RmNs2SnMCO0P/vEVb3oR/J7WdW5fCMkYCHPArbj8iJGBertKQ
	 syjGimfnKXqMOu1ZJlGC2LCY1c8W3RsncKDE+tdefTOorb55BQpHqLPU78SZPWz9AdmrX
	 7iX2vg6B/1JfBqOdS9t3wLzRnUcWQtU8UZJlYSh+puZp1ZxGG0ZaB8SokF13GcNbEoiRr
	 AnjMYCH3mCo6iK3wA5fwnIOEu+dqYnp9v2Mbdnu7tx18ScgnasvwbJLXhM5kLF5Ofkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897224;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=hQVqdw1jZnyTvf6HuEzkfI/ea8a/7UEr6wdSrPO21uM=;
	b=gmeMw3Ge70YMtcWCYQfrhscpBUjiCe/w5yM/O4Zm7XIKhI3u1GJxf+Dwzdx1pKfsullW
	 FpJNCAZlwJjh9Rni3wolnIZYn/GEH+s/Kiyj5kjlOhpFJNhSLQ6a5EkFM3Vk9mwaqqLHv
	 WKTsR18xz0pDEHAFxxNQ91V/W7/rapzZ7zK2b1b/pAZrp2GFqf/TBJ5MR3L6DMCTWrqeJ
	 9cAZWmTDfSRKrUclgRZTJi/9Ql397dBUpqJ1VNMhEdWmGxyzg9hQjU+6p/gYtBSJKf838
	 GMfuWrIPmYcEmsKCS8vjn0DIRpwbM7ZMkuEJF+4gka2JEVYXY/Ti7vEGVJZkpdizFxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62490606A339
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 16:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62490606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-55bf11583d9so1086484b6e.1
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 08:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897223; x=1794502023;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hQVqdw1jZnyTvf6HuEzkfI/ea8a/7UEr6wdSrPO21uM=;
        b=sRowLtmHWjI20b0INBh9clQJm0TO+R9a9y42TL/KvHe1jsiN3poxWrGExzxqhehEL/
         CmgyZDvQdEay58vJZ/3McXM/p9SyH0XS/b18yxIcm1s8iBgZQ535iVr51KmmDEdf/pSJ
         5ma+Y4rmRnMp5d9rT0ykzG2nwbzXvBETq+fePdjAJeIvGl4S6tHQ71k+63XDcV2PF3vR
         zAZarBLTnsWEvy0AvqidBhouGPETf0i3gNJIbxVpQvj/es7eETpXF7jgnzyrJ8vJAjhp
         jGjx4agof8EhpgVXjqzUJOxami7mCcpQJRnkFzLP7HlAAiEaP7boetAGablkh6+1LO1v
         uxWg==
X-Forwarded-Encrypted: i=1; AKwUvBwsf3SPaigoBkmjbjW56KEwdFNE2NUogkM7r67j5LpGtjpoXLy+fnKZgaZbvBTgzq3xjyQ3KYaWW6II@lists.linux.dev
X-Gm-Message-State: APuU4Z/LHY3N1u8qr5EoZ5/5NQxmcZaSQMD10X2fbw5TEz/4g9kmP1wt
	SvI7aZT5tIP/idMD/AzZJo8/Ye4g6yR7GfYNDnCofGJzeIYhy2vBgz34o0pkomSFLpGmjWueUqV
	JNmnVDDnG18eP1wAihZuckwe92Fv/QwkGsx4n/czzbRQ67iENIpSdcKg6koA=
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2f10:b0:495:f8a5:8797 with SMTP id
 5614622812f47-567bde98696mr1829687b6e.0.1793897223413; Thu, 05 Nov 2026
 08:47:03 -0800 (PST)
Date: Thu, 05 Nov 2026 08:47:03 -0800
In-Reply-To: <20261105082717.c459bb33778fcf27e5675082@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecb307.a24d9935.80af2.0019.GAE@google.com>
Subject: Re: [syzbot] [mm?] [fuse?] WARNING in shmem_initxattrs
From: syzbot <syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, fuse-devel@lists.linux.dev, hughd@google.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mszeredi@redhat.com, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com
Tested-by: syzbot+4324f771847cecb27c54@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11953cbe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=4324f771847cecb27c54
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1624c98d580000

Note: testing is done by a robot and is best-effort only.
