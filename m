Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=EDzU/xHH6DGSddQIdL0JsUrO38iRO0y7WhRaR45myZTLdpwqd+esOTRBiBbqQgNl21oO
	 DwEJ1zoTuKOctq7MhSMdcjaiBJTrxBPhMHFK2xvNNZtPwVjbFzAB/Twcqadz7jYYZOJ6Q
	 6T2sVRllTXdrBhLmSY8RHObsgMHSIEYGxNXUZfxUWnxa+G/5Kw+1sKWgIobIdBu5SnUbU
	 5970n4ilZCRI15xeYdkQmoJILw47wbk5jQRoiLsL4CliCrXJgvNpqoSmIyk1/Qinpj/Xz
	 u+WbJNE+hvkCzls/0OuUvdWCQmgMEuDw+a9tN5py7uCHUmOkRLLrsuSuXnWVYBOM0Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=bdQj7c1XS+SjeJUHquW683SUMcLhGa4uN3Y66/oi+PlRDy07efJAcXSApe5TinmroQDE
	 7EJ2y5cLX7qBrtAe3Wumik3GADN/5fgmj5oQySuzhcVyRx8oMu2nwtmtEhhXF2u8Yzy8a
	 azo6DR76RykpoEgnp1Lv5ifsTYccdpBrIWUvEdvZiV+edLlzVlWkgrXYf8aLXy410okLf
	 eq/I8Gdfcsjp7y3xGes8tXF/tiiRkB6FgSeBr3vSR9Nj3uwYRQz3JYf+bJDJkzZ3nBq0m
	 dMuVnAOOwuGy10VfXgZKYv7kzY31IA2H3ca9tjCRBpN9YS0/qg1Axc+BfGT9dYl+F3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ilNgJ3Sn;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BC460A2603
	for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BC460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ilNgJ3Sn
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso832549a12.3
        for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=ilNgJ3Sntu0pY6pPhKI4uGJFNo+SlMecdZqgvb4KrTI7WLdZO971A0V9MrNandO28S
         3vq7hz/1ioS8xtDUN+qhNyWcbsmmyr7GBo6THELHDCEv1pF7e2vj/AFb7hRivjqepu/+
         KGD+4B6G07KrlhCpXD1iQRYOllpYE8oNrUeWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=sfkU7Fizq+p8UpvZvgU53OJnoTVwrmOX56BI4c8DAJnpb4cc+zULTvghx0oQ/jUvn1
         DfUqjjwQsBY3DPCs3pxeTstxuSRC40ySddpVWyhk57CEOmLWZfaWnm98h9mRjyYbXHKM
         vMJuUiXDHiNW87mmdmR7nbR6CCZzcvBaui2B8b/jAull9PrrTQ/MW7WYSzYfoLybxi9c
         Kqt1XV+SsVUtA91KJqBUrOIYgsNC/NqBdjAwLRlrj5+XnPswVqvHoeZcZ/M0PB4JeYA7
         uwKTNK+yfGPUK5q34PXbiXIm6ZlXBtb38f7a0Ga6temR3ZtfpBftjBUB/73BrpOWut5C
         Qc5Q==
X-Forwarded-Encrypted: i=1; AL+hErFMFdW+ZV5jNpX8jmzmM198s78MR1WleVSaQrrfiBHVOWPOqvqGReJs1WCcnXbpffzaujyHWZHSsWpO@lists.linux.dev
X-Gm-Message-State: APuU4Z8dXtsYy75RwQwxaGN1GsFHPMjO8vQwLlGkawBrDXYor2R2fJT9
	Beu3I8un0SM+q7xELHxiPQJHvbZKRWK4gm6738Tw6OdKNbB42Z/giAYUM70F80uM18o=
X-Gm-Gg: AYBFou28wwQ+CjBuDITYZm5TbPmXUC7oEHX2JvyqZwO4Z7Qkd7GT9ro8sd0mvN+6Lny
	xQ7wNLTZKG38coty4/H5ex93xYNS0UL8w9+oKtmakqnQVCRA/8tdiHW3bqBxDZLFW1icyr6h8Y7
	hF4k7f/EQzvLqdjq/EUPJnzJGpQBLKV/hLc+p5NT0bPVjktxQ5yY624dn8QJ+YZNR/6W/A9Z6Ri
	nHJSUIJKgBAdXa9HhRMmQ3gdE2HDGX8uSkb6gVtwY/uwpwVrtOLIh9/38yi5BpXbCK2x5v6spcn
	nwXh1PryVejpBFmkDjpDygmDjSCJ675qZ976Ftfjk2SCL5djjEHTxwf/K18rxHTilQY1GyU1fys
	2avrrJnHap8y9MsaqdYiuCtlipOr6Go7WqsgmlKPIBdqZkXU2h/gVQElHVQlbnGENDjxBFJCFsS
	grKyxiGvEdNI3/6fjE0zSk3hYvPg8iIGfmHe9tCY4JdZQorVcqkuRGMf1nGfjSbI3UlYqOrLyJ8
	Py0q0lm6zKks/xOB+ffr38OrtwqUtTOX3RdBWiCBsZA2OR666DUdN4J7xG9eA7/PPVisGRYuHjH
	RD9QNvVlspYBJjx+lUUAg+WOog6XheT5xulHTZAkW5eHf9GB4ra6XdsllbYTI9fnykDlUuwLVXB
	CUBXsQ4RPaneGJUOXvNm63bojMKgyyVE/n9BXK/f6T4VA5D7A/roqAGfgnJWA5DM1y8vA9VNTd6
	MYaKIIFwg9/A9aZ/VeHJZmJ34dE74DHSiKQSML93r7T9cSJExkNPaJU0Dg
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
