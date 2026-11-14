Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686757;
	b=KiqbOxIXXu3XRRapIWfHxp4HF9YcaTQy61Iq0QeIvjO2hGtN0K6l2/9YvVqsXvpDcdh3
	 YNvRoyKVVloWvt1cK4as9j1kP7463/j97h20JzzGG/1vYVBEOSQccUaCyiNYFrsGalJ/M
	 n3/wYuWtKvhcFWGtbEMtLRN5XLrOIiG7qS9YZJrarr6WuVpc9dHa4qWKY/TUGT8dZlNn4
	 NUQi9AIIV68lDU+SBwftk6I/HM3fsSwOZF5RV3NBKjgbjDEDpZutrDLnzs1ZB+KPe6K8R
	 4aACtHAbjF0Xvg2O9InXkdQrlW0j2Q4tH/X6kRWTGbK2lkRa36FP4byBnYXYQaokdqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
	b=ktp5Alxe8HVszdk0M7eRlLA9faVrnfr84+JTULoxkzty0MRJdNSrqABrYnMZVIguInAS
	 1ela/apc+PeSmkdZQojHiGQoOVmH0J0cUd6NmwnwJJ+L5FouPGX+GuPgZxm9dp6Gp+96c
	 u29FvOt/3E4h8on2H1gINMgVuXSrzqHxLLJPgzyGnZa8mFJwvc7q0kmH6ZDf99gsSn9zC
	 wd6Au2n+Cvmjekcr1o3jGUNTJojGPHzMyc+XxnFOMi+dHEFZjfkdAj8s9OyOyA+Z6npwC
	 VfAP/NdiQiVIUvs815hYnoyrcLuZjYuK4I+ixOOY2L9qmD5FwbzXgYF6uLCwtfSmpcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=PzooN50t;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B021606A327
	for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B021606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=PzooN50t
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1295171b3a.0
        for <fuse-devel@lists.linux.dev>; Sat, 14 Nov 2026 12:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686756; x=1795291556; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=PzooN50tk6Jvo1qz/TShfwPqaa4BsD8Gg+GfDc5bzng12G37IHsCyHW+pKP6tifk2b
         oNjoJBEHbYzEmeMNWndVLiCwfsU4HSoJbv52m1N+6sbHWEHQjOS48HDR4XQmwrbDuJvf
         BAxSOEtWBW5hNocnz6dgI+fhoEkWkh91+mn7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686756; x=1795291556;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SncZUWGrBOxT9WurRufkDIe8hGFcWm37DANGybHY+fQ=;
        b=IJHGI7acXExMftG8CB2tkYnRpA2etBzfRway6Sae5ap2NrPDgxwpDnoXvBJHvaDMM0
         GoFLM3ax8Lb3x2DgT6aaLZTpyE2tJNwFRrevzGrS2tyMkDbmTiFjgexnosiRP4Hmhzzw
         WnjNXOIatjfvznLEkNmXXmX8BjbI5lBX7UkHZmddgZpfTgGcfIeMH6srwZY/8iG7BAPr
         D4pC22Gku9/CwH5trOWplYQBSiNHNO5uxn40uUGqFPgnakrqGA2QMHt1V1CWzOvDoS9/
         li3a39OBvOwEy5DAq3MDccuKfRop+ZTyoqPw4vC8AFExJDNXXDj9e64USNGEROC/QQKJ
         zKOQ==
X-Forwarded-Encrypted: i=1; AL+hErEq7oGAr9H1vccMzuCzmMzGOYauiDrae4+8TMnAl6cpdoAZQ0bfzTJBsmySCOX4N33XeCK3/i6haYrP@lists.linux.dev
X-Gm-Message-State: APuU4Z8cePAqvtNBXin8qyC55H7n+10hMyh0vAmzsNDVCL/pW4gSgyQ3
	ju9oTYjNsi0var+K2Z5H8TfVxSDhG9ksw/X3ZhXAj/eHcnTIu5E3aDdqZqXXTRAIZCY=
X-Gm-Gg: AYBFou2/NfwI3GX3TdCEP/5Nka9dOxXoevKPQoqwK2eHjtNg4DauiCafr+MKLWIRMU5
	b8QAdUfMz7YbWjGcsvTrLouLcs76qbrP8TT0eOpxHzDSm+zDgQ3V/PcUJwDsr2lFKIIE+BQW7Fg
	TQSyGGYOFbHZ9vYNwYHf/lg8aplhepx6iPPxFUzGJd6E20PBxBKMkomiGfIVjygsRAQ+TgFDJp3
	8RYO5dfn+a4mUiUgjtjm2LuB8ePI4foOOt+Fxv2+KGAwQ/hEs8ZXA65uWTMphNwswJDHKub3VkP
	qPsr65/Radx4X/AQvPPufX8HWRU0kFu7H7CXCCkpTmBszw33YedlNZ8xgxknL23mPFEQ7uNzaxs
	yeTWB6q+Cw90xlF6ZOPiAa9oO45TRjq/seLUX8HbRAGt8ZNCGDd8IxQCGaDfCU8DNeQgdW4uT4y
	mi3AOvzYBTJRZGazRZ1NY+KnBCBP9O/P1cvtqEELJZGHaq8krUbxGFlZTMXFowzhbFAuAE+Zr/0
	iLWONzarFhAP26dA9EPUk4vjiBc88ZXcA4gJT4XBFdMwDaYVhUQn+AL3s3xRX+z3Xgimku5oJdx
	R5Nz2Z0HQDON874QhM/w54zDsyJwnEKA4uDZ06F3hY5rzF1BoYf2F6vkairq45OFRKCRQCgQS6L
	bsPB9AqK1kgOZmkx34KdgklRfleQwlMaThZrmoKA4RD+oN34WGWYMrlZtpOfRFggKsUjBciPNyT
	G1wA36YZ15faGWvPKWtV/FZkuB6WT4g8mYMkQ+3VvArbMDjIXqlGKPuvNv
X-Received: by 2002:a05:6a21:748b:b0:3e3:37ff:3795 with SMTP id adf61e73a8af0-3f7a4dbfbbfmr5517650637.7.1794686756009;
        Sat, 14 Nov 2026 12:05:56 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm2271197b3a.13.2026.11.14.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:54 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:50 -0800
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
	stable@vger.kernel.org, Alexander Mikhalitsyn <alex@amutable.com>,
	Breno Leitao <leitao@debian.org>, Casey Schaufler <casey@schaufler-ca.com>,
	Chuck Lever <cel@kernel.org>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH RFC v2 00/42] fs: don't use pseudo filesystem files as
	storage
In-Reply-To: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
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
Message-ID: <20261114120550.0c9e73aa12a3072c@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Patches 1-11, 13-16, 18-26, 28, 31, 32, 34-37 and 39-42 look good to me,
so for those please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>

I've also tested 5, 6, 34-37, 41 and 42. The selftests all pass with the
series applied, and a uid 0 without capabilities can no longer change
/sys/kernel/reboot/mode through a loop device. So for those, please also
feel free to add:

Tested-by: Chris Down <chris@chrisdown.name>

I've replied separately to 17 and 33.

Thanks!

Chris
