Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF4394788
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.232
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586990; cv=pass; b=U1Ts+7e+SCQbRY0yWitpVOoz8NH18Nj/qwFi/krV902L7PdNHXAiTAlglllzNQcP2wsLv7eFIcpSmImPrTRuiRNpOJyU5+h6S26HTeC0YwYvkMuKvI3GjomZpD91HfC6esKrW9xtFRnTTgk3whARkBOsbLwCFeUxeJ98OLMIgcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586990; c=relaxed/simple;
	bh=Hc4xua3BbP7UILjgY3XhVLKk2hxKdbiyd/76MJ1+u0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZDE0axgeEv0IR0bdzg40NAO3uLR1rAHBoh3eLbIHzV2gYqJgWYUxKEAyBUtfOB9/e5G83k7RzkMbtakEhKM1zKyzgD7OEFL3YpT59TAVp5YXy1XgOeyhaTxRi7irUnZ+JGZ9QXW6iUDaUVu13EIZf/xjTfIzi+FS/tVHlAnTvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=pWEd7LL3; arc=pass smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="pWEd7LL3"
Received: by mail-qk2-f40.google.com with SMTP id d75a77b69052e-53324cfe178so15985031cf.3
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 02:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790586985; cv=none;
        d=google.com; s=arc-20260327;
        b=SCMxQlYEABgMelDOmbdpjZ6n4aRkfdw3RkCV9ZDvbZWBc8T1ZJWO0Jq/wiIKclzVzg
         UBnwLbkT3pInBA/6UdgnG+j2b1TPBu3TZrQeFMXdKrLPbMXjyRS9Gh6lsICvHnLSQY9E
         jNcEF/vN7rjfLDO5Nik5FDmOpbQ3LQWScdAV2x1H44cnBh87xdmu8ZSK1scH5j8FdNZq
         ogvNuysDJM6ma83Cfwr2BEVwrhjLqsM/ZD6w/EWkBqf+fvOGL2ZrJBUD/stEZQuY+WLX
         NZU5MQzHe5BVL3SX7fesUR97gBFRGLfE8as2FAYzDOhzJ46snlPFNyxx/mhkzZU6J8XI
         8vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=piSx6xOER5Lx1c6N7GzQrQI8iU/3g/EBY+kw9aSwb5c=;
        fh=F+3iJZZomjoVjyNg/Txx9nmT7eP0cxACHB3q5/5VSHY=;
        b=RgBzgxcNnrTsGYZJBzxNWy+GZn70/h2NtOck4A69TvnfuHO0CNaDb6wJZhw030kZSs
         J2Mi5a8IJ3nkS2rUhFkTC/FaV+5TSJRhseAfMJkRSk5gj0E+KXuHWfmM8cwWSp0rEXAm
         C0BZm1ynSXvAxxXba6ELnpSsLwphei56bWb/ZhQLvwaN/3NlfvOWIa2wkD73yIjv1m+J
         QnlCfk/WlPmeKaggBBd711YoWuSWBd5KT1uw+mgJpOc6nG9YDQ6dW0+3MnuhuqMYNQ3o
         nlwRS74z0bJkiZiNC2YLGn11oO3O0J8wcOriBmM2xFfBoZf7qFNDNu0qzKTFqY+4/7RS
         q5Sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790586985; x=1791191785; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=piSx6xOER5Lx1c6N7GzQrQI8iU/3g/EBY+kw9aSwb5c=;
        b=pWEd7LL3gaiz7kA/OSF1afcYkUBt8SrGHp4gBn4jpi3aMGr4zxTHRqxCKDHfKocDDm
         6fshyoHekzNt3acJkTFCdZ6COUTODNM98GWFZ8YWVqrbu4qjqhE/1dghiOyIQIX9mpbf
         Zq9xuRSTzHMm+PlqgYVfNAZV1AZU0ecAZ0L+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586985; x=1791191785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=piSx6xOER5Lx1c6N7GzQrQI8iU/3g/EBY+kw9aSwb5c=;
        b=FRDvz4wjDyaJ1bSHez57iVO9kFsSwOWqemTwd9SNxtVg7LJAiDEhFKCPkejlZT1md5
         zhkniu6LxVgdj2uOTFQpW3ZBzTJu6jTyYfkjJ18qj5cvJ7h8PS3m5c2QdqdA3rBDFzpf
         5aj875uLfyNakM8SLnWuVCyjqaT6ezc/jhWkooxPh6fp+EemniWUCNMN4fgzlYtJOAOC
         v3jg+maNt+vhBSkSNbKDk5gG/ZY46tf2VCqVtFrOAeRQyr6PgYlLmTpCKAO6oCaZoUeQ
         +k1R2bwnJEgvieJ1mkEyQIhMcNy7RjygOtjt+8YqQfpWa+Mj89yS4p+rUfJHKbVnYWMJ
         gTRg==
X-Forwarded-Encrypted: i=1; AKwUvBx87XS3bITs+Mes6YmNlPGkE9bzN1KRQhycEj2LbcJG1KyiU/4kFp+aMEXrxxoN8+p7mvaY3sXttOUw@lists.linux.dev
X-Gm-Message-State: AFuF++kDj8xpOLkVxqcw7Mdby83E6XNDHWeMCGyWeDY36PZMb+axEx45
	aPdE3Pk3s9C+jdsgllX3jmIExGNl5PO6EcDbLqa3kjhheEZczI6KzB+sNnBB4bTY5HdJH15bm82
	vv/F7s2+kyNDgTZMIIQD0T6Hvuz59AebML399Rmikhg==
X-Gm-Gg: AYBFou2hoqqO8vg92w4UNqOZwKPj47J2C/dMYI0FjbeVxcvTwAh8kBQN0VW7lsTLjrV
	436WC0pW7UIXLDIZjWgAkTAIZobhvU/OUnUREfypXdNjTVDoveLX1mjIqx9ddlfQ+8pWR8xGY3v
	S9qAzMHalioz1wHXcXIcGD7VnSTLIRo7EF76nbK0jN7m98V5bma1mYmdrP28+EcynWt0NpayryS
	Y1sFWfccgpzQni9KQt+BtLch4gxMm9DQPWWGqX+A9JtUzp9Pdo2D0Cj3mXOIdpiS8AxgsxheQSs
	5+ljWHM/TEw8Us7DQlNl0PzBaRs5Z+KdoJtel1cWQbscRHdIWiOCmg7c6UIQTrNFNzoY41N07XQ
	xVivD3kQuGaK/ag==
X-Received: by 2002:a05:622a:120d:b0:530:f73a:90ae with SMTP id
 d75a77b69052e-5330b6b9c02mr204386401cf.48.1790586984901; Mon, 28 Sep 2026
 02:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-2-mszeredi@redhat.com>
 <arLR49IEKWd3ioMs@aschofie-mobl2.lan>
In-Reply-To: <arLR49IEKWd3ioMs@aschofie-mobl2.lan>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 28 Sep 2026 11:16:13 +0200
X-Gm-Features: AclHuK_82EUq4uk7VG1kn_mVx4STdMbhplPsiNmZIf84CZpqfg9gyA18_jlfEi4
Message-ID: <CAJfpegs89fCnQXsvHFjJQFuKT3Zh_Brx=uFtnKMfvpEH-fqW5A@mail.gmail.com>
Subject: Re: [PATCH 01/11] dax: replace exported dax_dev_get() with
 non-allocating dax_dev_find()
To: Alison Schofield <alison.schofield@intel.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <John@groves.net>, Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 21:07, Alison Schofield
<alison.schofield@intel.com> wrote:

> A couple of process things
> - use get_maintainers to send this patch to the correct folks, including
>   the correct mailing list, nvdimm.
> - those folks and the nvdimm list should be included for the entire
>   series so reviewers of this one patch can see what this is a part of.

Okay.

Since it has the RvB from two maintainers, I didn't think there was
anything to do on my side.

Side note: RvB and Acked-By from a maintainer seems sort of
equivalent, though Acked-by is I think the more formal way of
approving something that will be merged via a different tree.

> So what is the thinking today?  Will the person who merges this
> fuse-devel list work include the DAX patch in the pull request or should
> I (as the dax/bus patch wrangler) plan to apply this patch?

Simplest is if I push this together with the fuse stuff.

Thanks,
Miklos
