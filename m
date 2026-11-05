Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892053;
	b=G6r8C7yWsCluhYCgfn6KkTWKMHVaow5T/+lY7Pspa1GlCLt4wDbHDtgykkQp9q8nGEN4
	 KdFrYlHPyfUArWtB9HYz3gLSBK5Or5B1iDD/56+ZipRG7da60KjrjlQn/hUV6k/FA258H
	 SjeICHudmDZUsj1+Jdm5M5wrOGiW6paf2+Xy3CxFjtAdbVNgFMx6rPqdkCcWdcSpX4kKX
	 WqYNeQ9FrjoaD9hVaGKx7NGurYIZ6qa05TGhXvbhiFPRUXI0+ajdflWngZ6VvN8ISITJ2
	 MRKZbZO7bvunV9kUm1QCporfbV3PQbo05JM5aqkd946gZTYzBVQPENJmYprGXbMcK4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
	b=CWYuVRXPnEUQLyTcmVdmi7guOsp/2FiVPOP4MUf+ALgEumjAAGR7oCbW19S6ZLnvV1DQ
	 PsZkPP8UtwcZgKPWKhKe7IRSIAkHjjxoZMHBD2nfj/mnIfjGTTv+yA0ks+G9QsvrAuyMV
	 K4DBK16eAYBt9S68iUWFKcRow9MV6QS4xg6cbR+6DIi243r48MGJ0a30nZHZgZQF3vFmp
	 zdExcTjYjo0G57VDqHahEb5e4JKyFCr1smREqAZfI7pthYF75vM9AtCVXAvFw613hjt1x
	 knb8oeB6ngYvrdGcvvYHE2EMEhRgASnq8kGkLBrPv79qcpoJ6au9WZZ8j6pgnz1wLtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=D2Mjj4M9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB203606D82F
	for <fuse-devel@lists.linux.dev>; Thu,  5 Nov 2026 15:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB203606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=D2Mjj4M9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-353804b591eso3801051eec.0
        for <fuse-devel@lists.linux.dev>; Thu, 05 Nov 2026 07:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793892050; cv=none;
        d=google.com; s=arc-20260327;
        b=WVq2xcpbREm574zz/1sI03j2Yc2vmHlYyid5GgQTOzny0GpdcitQgt6RjXBFFE3Su2
         3gZekqtncsSWCzjseBNatXfFrKAeSUzSiu5I+GNWOpBzr5w25xFJ/4VRKsJHhxIwd2sr
         FwVR7GlyRUSfiysBsPCwetgpMW5qJ6UFfSbJWO6UvyQiuw6Tn0aT69Hh3qiyXaarniqY
         J9S3uVCx54O0Zlg/5VJua6NYgbOlFYCeqIOkGzyAQ/Kx8TLW2XyhYcx02pvReRDrTW0m
         6gHvoqlhTBmQxR2OM47bpmvQvGL47IPDy0DLtJHfOsVXI8RybRvxl7dqsGWD1iSysICR
         DV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        fh=1cDlCrYQtf/GVpmomWfJ5cDUlL/L6aAZFHS4FHAsWpM=;
        b=Kfw4f/7pqTbg5vPi1gWFevO3cyfxpXtSNjNzBPb4dW+hhk55P+bHgSgk6VuKzPztOR
         PKhXXVCn6zlCciS4kaerLWalB5inDWjk5HwqvRib7d9RBi0yyaxpE5YKEl15jAS0JXKN
         6w6P3f/wx+FIdgKT+VnhR3G5HCjAqFaM6YhL3DDCE+gdL/uYu3/lZsY+dBBHYr5cVyHW
         Z5x/AsCI2O+EdLTDR130xMV0ZXk76cWCoPgXxz8ycHVaRZNPBWWTgeY2YxNidkJ22rL3
         WHBU7YfdAIcmI1RThpeB8srHK/UQWzZ63UJFMw3DRnL11SF8O2ZL1WwEsBn+KZNQ+7Up
         KWNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1793892050; x=1794496850; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        b=D2Mjj4M9NCdRglYX7x7i6ipXxb8JwZxs9I6RuGwfavr62I5Y23ijHLOjPot/GV5OO1
         VdzixysrLcdDPYDZcsSAu+qdz/ZFqAQf8MXcdxDRgJaey2VXpynmTLugisAyJqGRyNf0
         Jq67Nb/hz4P+parKafCFCq5bltfHayq7Ex2Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892050; x=1794496850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oNVn8taDxwUxdvOB1h32bxmNoqj405m6JDzlp9SE6o=;
        b=T29u4g57uvbWuEC2Lzt/kL5XaIWsctxqg506e84Iom8W3xC0oBR5eqi2uVWBegZV/t
         bZFC5HT9HVhixBY/nLy2Fph3IBE5WO1Ez+ggKk/C/xC2PK1W6dDOPqVs+iz+lyqMVnYm
         /jo08v+hSmEH4jv/50Hh+XXR4e3G8sfHWnN+STHEoFdWrn0Qtc9j7ofpYRJkJGj39xUE
         2jsO4sopg6GJteqDLYem+nedf7XSFyDjkcTMGGbeLW4dBEaIkcyS346qFEEwde+fV2mE
         0RCa3UvMXJLE1jd3b+z4R9/0Yl3sOrJWNN08WQtvH7JHAGgFRYLp6JbvtfpaEe/3szVI
         rXfg==
X-Gm-Message-State: APuU4Z8SuZQirLhc9tXomCyXFBd/w6a/7CuXiSb7uGzvnJjuFXD02S4U
	Xic1gFWAVcYPcmIpN0Y8glz9iAZh8/n7+HOwtRQpCrj0jEcK01DDIVVr3ByY1vcauzN8U57iz2b
	dNZ2QfOhHl+NTfd+U9GeHVh+HiXo/aMCyQV+QfBbVhA==
X-Gm-Gg: AYBFou0WLAfhDqsG1pSk+G4TdflQzkupQ8k/cMUR/AEBi+b25Yg/NDBdVxNDLvRn1x+
	4gZ+c0+OyCevQxMKp89aKi1D5MQBp0nbsmq77hn5F5HhwMiGaojUzjIQiWGwYRGLLl/f2g9leSW
	IO2wWu3dKuPrtS91dE4DjfEb7Z2+fchpkewD5aLSynLQQmiB2FmqX7aKPR6hdatwZVNZ1s9wRUk
	rUWW6Jbutu/AM7el1QLYDIVrw7Owjy+ekSw4r4INz/v82D02ZogFvr4FY6vhVB9GCiDjQByS9/e
	SXyeyubQTV5awOpD/lvF3lYtGRvJ0g5VPRa7OEn8wXAG0rAtP4ScFS7SALu6z11YVn9R/p+IHOQ
	UU52QDerlsb8iEtq+AY+fxg2MnGNTxJiQ7ms2xolAIodatcbLNLHjJsF0TXnJejv67YHxPrEZwG
	6/z93Fvn07yjLPOoTM
X-Received: by 2002:a05:693c:88c8:10b0:36a:1f:9b74 with SMTP id
 5a478bee46e88-36a423bf83emr29053078eec.27.1793892050273; Thu, 05 Nov 2026
 07:20:50 -0800 (PST)
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-fuse-cuse-release-v1-1-8be1eec02c66@gmail.com>
In-Reply-To: <20261105-fuse-cuse-release-v1-1-8be1eec02c66@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 5 Nov 2026 16:20:33 +0100
X-Gm-Features: AclHuK8DUdgD_8ZNs09MZGawixt-scCOpxSSzX7YLcBDzrNxhZfwKgYKjsYE-JY
Message-ID: <CAJfpegtebqB3ECjvLVXeVoADsAjC2B71ozYbMaUn3D3A3D_1kQ@mail.gmail.com>
Subject: Re: [PATCH] fuse: don't pass a NULL inode to fuse_inode_backing() on release
To: sariorkunemin@gmail.com
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 14:23, Orkun Emin Sar=C4=B1 via B4 Relay
<devnull+sariorkunemin.gmail.com@kernel.org> wrote:
>
> From: Orkun Emin Sar=C4=B1 <sariorkunemin@gmail.com>

> Pass a NULL backing when there is no inode. fuse_passthrough_release()
> only prints it.

Applied, thanks.

Miklos
