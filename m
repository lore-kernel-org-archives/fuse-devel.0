Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1381448399
	for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 12:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065805; cv=pass; b=HiWc2t/goO3H7QOMA94HVqVxOrCcxSH8szjGZEtCH4/yvHSWHRfTl0d5cnMb1+zblyHbzhR7TWGdKfHs2e2aSPmkgX4F17g6QXcF8nrdyOayvNybA+oyF0nOEiAVsAsX1Wi2fqVFyKXpoJhfT2QjWJ8DHhPTgFJJeb5iFQBi2oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065805; c=relaxed/simple;
	bh=bk0KTXDILaFMtgyu9ZO/AO83ewyYbxEO8u97WNp+eHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILErJVfDHw42kD/Xxib9JOvK4XGOhaDGf/Ag6CTS/yUjbKXYg8VZizS1cACcUMvZvWD/Yq6jp3JTSypHLEddFyS7DCg4B10VtMbWllCVnv/qhobW34BCywWuatNclH5Pm6RyucsCOhygr6x7jLo4pknzyRl58w9nUVId/Eeeh28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=juVxsKFp; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="juVxsKFp"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53396adbc53so15714581cf.3
        for <fuse-devel@lists.linux.dev>; Thu, 15 Oct 2026 05:03:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792065804; cv=none;
        d=google.com; s=arc-20260327;
        b=lMuIFiWwI6lHA+wDDHcl60GAA/IDztfDPJbUiqvWek+PcSoUNptgKgVz1TvE9QSXMJ
         0FdgzY3MMDOaSoCUlIeve2g1f04nD6RO6UqNydbFOxZM3fgBei8negdBUztP5NOFUN8R
         B3AvLbCWF7ifRFRR6ffRDHFBJgs6Z7ix2xUpcoo8OGiGQY6he0M6Ue9v4GX6TAMseESJ
         oxAnVn3FL09+H8xmsIM5g/ojLBzqa1UTPtlANcxurnH5XT1C2ZX+b4gU2g6mH8WsCjHg
         Vp4JnlXIYkoG7xFiZHmjZTqATMQNtlDDFBMq7AJ6M+c+l7jhh8SQNN0BJzB/HEsDP9C5
         mTxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        fh=M3kr+E5EMPtYBi1rkx2LsMRexA7CdlOr2lS9zYbXqgE=;
        b=Hc3V/z9+EMdbYRM9VFTftn19xqWAkxmWNh6XM65vhBZc6dLXDCHq2CzTAGXo6MH3b8
         bK/JmkNtpG2MJ64nlMN1JGpql1Dx4YANbjrjnpWTQOnOw14dLYTNX7d2J5Sbc4/ONhE3
         2gN2D+z1FiWs+k8X/NAK6D1xSVgh4lXlxrca3W+tixwzD6qSoQSsx9iBBj6+wkyEb4fk
         cY9LqLNSoNeF5UdIqpN7Q+2EiJMVpEG/flZxVE7k5TUPMflJe9M1AGYRrXkI1ExlX8PG
         5N7ZsMaysEHvVlnfjXmQmT91so2BfHz/MGF5LY84aAL33ySQFEdj/hBEJ7Eff4pUd4Du
         hxLg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792065804; x=1792670604; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=juVxsKFpxIT0rQmA5WaN+OHgE7BmN+1++JyyI/gXKDuWuMlaihedcDuU5f/BtTWZVt
         Jfmnq5yCk8AwP2HzJT1bs4rjRPnWmO59JlJ1uLL77yBv3F8Nx24ms2Q0+/jKZx1LHy9w
         MUMP8mb/FHa/x9+VTGrL/p/JRKGlHK2LWDhFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065804; x=1792670604;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n1yRlh7klOUJCF7fQuz+rO+3biKuZOtnrUH4G/KpQVU=;
        b=UIy1h0rjVpcHU5RHYy718cwZ2ALSJnXzD+xaqrct1p01xaNT+6Itk25tc4PJiGli/h
         W72zduYvPMzkPuwexz1EhlATmdrg7/9QNNXm6aBM88DyZhZGu9O939vpbttem/XidwkN
         S/urldp0P9o3o8kUOeCsWp1+ZJw1RIMm+06kgFMmyfohPpSVCu1Lge08T+F3tI3bTLfS
         Xw1qwDzgOd8vxXCzs+0J/Gi4HNVROJZyBIqU++H9SLu7ha+hcbWiKzdWwxh5jrgP1S/0
         VpHnXgCYKo984qgtVAHcCoDscC1Lx1wSsYUV8zriuBNv17fU5yNr85ZfmU7vG7lT28tS
         Wk/w==
X-Forwarded-Encrypted: i=1; AKwUvByjb/Yu7j6qELortqJ4hbG4NFipvEKPEicXTwDbsqrGJmjPn8cg94uLkOXnCAKNzMoyB6UraCHk5LJY@lists.linux.dev
X-Gm-Message-State: AFq9FYI6MIf8z1b5Mk8YTuxoNbu3Dnqp8cM/KrqbTXbs0xq27WmtUxCt
	imxVVjDmW0EKzhFH/373a/lIRfRnf4uAz9TXcFf0w9Ns4CM3gaqHXXrAxUWsAMi965CBodjdWHz
	wjdYxAfw/7QxlnKShNi07iSQkgvxu7lqu1fOvt8807g==
X-Gm-Gg: AYBFou1bKtkovbZ+nuWoxlq8enH6lNa/aB++iQ+/NzFVcHhMf4dVVkVH5B9Ra5LUCrH
	AFL9UWWIlFXRKLNwOFX5O3Ral3gooCVLMpx/Cogq7v2elqEvvorcq/YroXP3ckG2PGHMDx3Ckkk
	jUECBFONHq4GmOqqUKEcHSx8mMN7qnqJCG3J7wFMY4mcbNsCALs7Bmxmln7OXGNT4cwHFr9W+2Y
	yNttogXsvekkzC/50K4BynfEl1o2pE+xPbAPmTXq+2sAvY9fkEXNbRM0UqZ/ueqVFlBYCku1awK
	EMMAlDuH/WBB4/gf1roFW2w1QA6tZbqdYbkikShnXyNm8yUsZbg2yi+Lfsz/vteahEzP+EGRow5
	8nH5TsFN+g1cxqdOyNQ==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id
 d75a77b69052e-535a5fb84aamr281517071cf.70.1792065802884; Thu, 15 Oct 2026
 05:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001164916.15311-1-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 15 Oct 2026 14:03:10 +0200
X-Gm-Features: AclHuK8MiHyjueHnKnwHtYPGKuj_TddwwVafZUys_JcMsu0_shaAG05CNojzKZI
Message-ID: <CAJfpegsFZ=K09Kzr9Eec0sQR9gzxVHi=PDyQJs_bOKvfwGiU6g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 0/8] fuse: caches documentation and testing
To: Luis Henriques <luis@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, Chen Linxuan <me@black-desk.cn>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Matt Harvey <mharvey@jumptrading.com>, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 18:48, Luis Henriques <luis@igalia.com> wrote:
>
> Hi!
>
> Following this email, I'm sending v5 of this patchset.  Here's what changed
> since v4 (mostly from Amir's review):
>
> - Included suggested changes to the document
> - Moved back 'struct fuse_common_ctx' into tests FIXTURE
> - Fixed a few typos in the tests comments
> - Added missing SPDX-License-Identifier tag to fuse_common.h
> - Added an initial stab on the dentries cache (hence not adding Amir's
>   'Reviewed-by' tag in the first patch)

Applied, thanks.

Miklos
