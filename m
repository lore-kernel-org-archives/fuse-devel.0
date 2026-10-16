Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785D371041
	for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143573; cv=pass; b=jDt5ZgZnhCPtw0IVg3Q4uW1oaRuXfl+85E9dcFExsMfxKUJh8At/UpR9kciC/OQmevZPANYKJncYqgUZvcW/GuYTo0hX44l3wqcJKG59E1xq0X70ZfO702v7eki3tS8g6D4Ctjt9kn7XxWyvh+T+0UTbGQ06Qdu6sJ+JDvl+bFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143573; c=relaxed/simple;
	bh=ZjCCv2vHBwi9IOWqvGjy/7XdqWbDo0x6Omk32EfPwq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAuEG6owedPhn+kcVsFoeuV74TqlAPfhuAYcx2XYD6xWntQkURZA2iRDFo4b8zoF0fu81LJjdUotOVvi+syrHXHdc8OdjT5jj1onjaWQx8P9UJihTrV6gkhhGCeqj/aJyIGnQ8ElfYRnd8efhDRtLv0x76ShXWFNJAyXUyqWJCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Wrhwl5RJ; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Wrhwl5RJ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2306952eec.0
        for <fuse-devel@lists.linux.dev>; Fri, 16 Oct 2026 02:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792143572; cv=none;
        d=google.com; s=arc-20260327;
        b=BHD4sjY3OnGmTVhys7Wqfu/800gsE9jvCefWvLOiI+qm00YXutXgGqHN4YPqZ3vexA
         o0uDF9X6BCKqpZh8vDhS0BD80hmQ/mK0KV1xNwf+AFx+vL9LmyullZndEwe4PWEUqLsa
         zh7C8k1PXmaRZxLjQ6ihSVDctznjStfWFVrTq4dUx7OsXDITspV8gdzlKfnG2KIwfBZc
         4O8yYrqeJIKsuQ88gSohvOXIM8+T1PjwQBiRXdpr1hzI3Lj07ZNbfZn+Cj2XMcqxYDco
         4aquHqXRzM2fdoWF3jOMSB3q870/3lMmKGwoktSbUd57CBRRn3tOVoiEA9Fp/kV8HM6o
         59bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        fh=wxW7gUvjxGxACmvH9WPdkqNZzUbHdbta+dJ6PQ8eNf8=;
        b=r4imv8KuLFpgC7hmmpCbYzB+T8fozeV/6DzgeUW+dPQc5yJu813DItvaSX94D0/NfP
         sJca0n9nKNa/9vczJD9jYEVgQ1uWXolxssAw/9EcuQl4HMpCtUwKXSUC/zEHH4L80PIO
         fuW/EhaDbdthDvBJ85eov/5R5ZISTK+pOHk9n1XwSJUPAJwL+qYnE9+o1XOBlSH/Os/a
         xRxMHuJv1CVecSo1oyXgooIPleI5oNtGTAFLaX1UNeJ3425nhQRJaf9l3EXxYj2jdRp7
         QXoqCCHgDBBtbxRCEEprvbgsxxn4I48F22mMt3fUzjaIbJasYx4AC35phFHm+XWZyVQA
         WVPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792143572; x=1792748372; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        b=Wrhwl5RJHPo/QPG4y5E9vddoWwxpOHwUIr1N4aFoo4D9UIbeVp/JuOsjiDC/kcRpCO
         JKJwU1FZ4xU3Zvw3+M7j8S7OnPtXSaUH1r2dI3VBd6CuN6FL+HrOPRwv8a0/udZJc1pf
         xcCDm4/MKBbyGc4LPGPfRdeK3eKeMDelyDSBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143572; x=1792748372;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j3B/54ttrXHpvRKJzNCedyWQvahtZ3m41HUn5RlCMIg=;
        b=pEB85Erkv5Axm8A2QRaf6Q3G7MJkWVPN7wUBjfk6abaFxwYX2E3cb0otGHuzI4/Ea/
         4QQ4zJ9F4hfwKd3FlYQiVZemwB6PMLUTaKPHPsogOkmq35fQvqa8X5caZzthrK9llJsA
         ZOwUguVOYbr5soSz7DnoP9AlsMUPyW09Q0kFY69WWOZ8knEfaCAUUD7uZDzPXZWOScGJ
         yUkE4qsy5t2ma9DqrKcEkxr6Ubk7gr6xPej+geWdc+sjAEX28/etm1sj59C7sy8Skx3+
         edrMB/8kl/DiBS40X+1R28yXUDdia4wyF5CIs3eNjrimDalDUSyD68HPCFr2eOxJzbJQ
         BtUA==
X-Forwarded-Encrypted: i=1; AKwUvBxx1l5lx8iy/Qo0P+mmaLH/WO/XFS4b+A+xF3ntjWRqtVSm7xRYwxEfa9U85/NZ2X9I4SaIN5Y/h8sR@lists.linux.dev
X-Gm-Message-State: AFq9FYK3cd3FOE9NGl+6FN8o3bPvwKh4dNva4ICNzj5cUClLoT+J/unx
	9BrhJcHu6bjNgnFM17B3E8I5gvlHi3KhdIDadKWswLUthigEJTt0cGGSCSK6WP3/ArmCarsiSBG
	3N785/QrzC+F92Jr6WD+q8VpCrUcuAWr7Yvm2C9aZCQ==
X-Gm-Gg: AYBFou1q+OadXJpmePcAeg1PfRp2YjhOvHndJBUSR7keaueospptrXY9vLlyTBVGlcH
	qSq6Ca82fC3CooKnCMVMmfQ405wDSXGsf9eJezzV1KNVAxJ0bEJLADZGbQipC/WSqAW5pimPzm/
	d3hVgzRlkzT95d5DPWhSxB7DKpqhQytKrLS7WPvMZ/HGcx94DaMXa1PjwdWETeAvliIQymXfKQ0
	yKmdNsJrrXw6yoc9rxD/BbUvVljWFXbjjys2o0ROI7qfjDzvpZ/5zu+teFAPE7a8Ekm7HQA/BHj
	3Rc9Dx5lk7YcNAebfrrrjtMta+L+E9qPKeQTq+n3SIS5seGDWbJpjKf47Q4StdLA5MzzXdqo1bs
	Kvdindag=
X-Received: by 2002:a05:7300:55a5:b0:35a:29b6:b466 with SMTP id
 5a478bee46e88-35a29b6c486mr18778429eec.30.1792143571660; Fri, 16 Oct 2026
 02:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260929032927.1451259-1-neilb@ownmail.net> <20260929032927.1451259-3-neilb@ownmail.net>
In-Reply-To: <20260929032927.1451259-3-neilb@ownmail.net>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 11:39:19 +0200
X-Gm-Features: AclHuK_HY98FdVFdI2B8_Xyq2_mR-0nCvi6kN-LGNYhpYxSjTYAUSIadCJthF2I
Message-ID: <CAJfpegtG2NGxbUjR-bifU4aWmswocYwZaxpvTSFooQ=F-dcWBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Use d_alloc_trylock() in fuse_direntplus_link()
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 05:29, NeilBrown <neilb@ownmail.net> wrote:
>
> From: NeilBrown <neil@brown.name>
>
> fuse uses the results of readdir to prime the dcache.  Using
> d_alloc_parallel() can block if there is a concurrent lookup.  Blocking
> in that case is pointless as the lookup will add info to the dcache and
> there is no value in the readdir waiting to see if it should add the
> info too.

Need to send FORGET in that case.   See this sashiko review:

https://sashiko.dev/#/patchset/20260929032927.1451259-1-neilb%40ownmail.net

Thanks,
Miklos
