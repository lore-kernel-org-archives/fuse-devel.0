Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214C47ACC7
	for <fuse-devel@lists.linux.dev>; Thu,  1 Oct 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861104; cv=none; b=Jx5MHsvlK3msUMapde/AqI/h9vYLWCdeqCOGuTHEeeuUP/WLm4dsmZbgWAoHbQM3dHhSdw1CHqOIhnE3JWyPNhqmcjLLE0t10lf8KNmdLH2Rq80sXPWw50hZJEzwzrRYSnOMcJp8ZMnRahhrn2dawHhm0wXa69hZew9Sm8pLqCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861104; c=relaxed/simple;
	bh=Hjq7y5xwF/o3OITGh831QTeK4BuPW2gVe2ffDx8V0XY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NYoHW6SKMQ9XEl3jo0L/FPeRPkEV1Rug2a9lSANQ/knab91CN4rxp3YBRe3b2m5wTsh8j0siuFgAk/e3FJ4u/JOr8Xwtbpx0r0RXvAS1poYmRfHaZZrb+whROpVTfLWfkiOnMhIKGCWua7oT3EkEjCjZEx3FvNoSRrWe/agaQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c734afb8deso10666971b6e.1
        for <fuse-devel@lists.linux.dev>; Thu, 01 Oct 2026 06:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861102; x=1791465902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zGC8eoo7sqBg/OF81st5hi1IyHpdEbJJnULEgfNzl9o=;
        b=uC8HG/RTvOOaTZH54OqUySPeij/aLy0Yl/031l1XWu2v8zhKhKlfoPM0bLJv4MpTcC
         SH1UpRl884k/vVIawW5ZlkBx7C6S3xL95rEuGtbcjSpJ3yvuDAYQeI9WjQiIiMdM9SoA
         +intjosUaK81rm2jsN5QALaacL5dK2DB6CzrqiofTNQNcVZnZdqD32fUyyYtwZXwZiwf
         FFb2esRORvo69r6OKfRANYNlpjneec1QisTtvMmucfGuHDFv1xkwsa67lgZPArCQdTja
         ywbrOmPx1nOUOoo0Y0ePw3FDjcy57ZF14bX4NrmwfNYhlcvKKcBXot0XIG115Ad08d++
         b5LQ==
X-Gm-Message-State: AFuF++llSdm9ZI7vv31a4lor+D3AtFcssBsSQSJJf4jn+eNciv/UTb3E
	rBniRqgVj4CCol/yS87jVBH6tTkst0/C8ivRPbwwNy4VLHg+zYTU1h68qap0FJbOkFJDsIEgWAc
	Tk+mwAS//ii88+Uvm0CYEcmNR7QvCojVzGRRyn7HKemxNyNZTY0xnwyqJrcI=
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fd2:b0:4e8:bce4:993d with SMTP id
 5614622812f47-4f1b724c7ffmr5141948b6e.11.1790861102334; Thu, 01 Oct 2026
 06:25:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 06:25:02 -0700
In-Reply-To: <CAJnrk1Ze8s8EGJqy62_mLbgvzW5fVVWMdeq3zSH0mWu_HRfpcQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe5f2e.f32479dd.202a09.0003.GAE@google.com>
Subject: Re: [syzbot] [fuse?] WARNING in fuse_iomap_writeback_range
From: syzbot <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com>
To: fuse-devel@lists.linux.dev, joannelkoong@gmail.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	miklos@szeredi.hu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
Tested-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com

Tested on:

commit:         fd179f8a Merge tag 'ata-7.3-rc5' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1036c035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=e8200299b0556976e13c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1483a6c9580000

Note: testing is done by a robot and is best-effort only.
