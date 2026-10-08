Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5B73CF200
	for <fuse-devel@lists.linux.dev>; Thu,  8 Oct 2026 06:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442749; cv=pass; b=szJs9Xlsg4p4YMJ4Sq2D0ZRQ3lhtSi/jTerbcb1RKpTVfl5t5roj1UNUu1ig28WZCu6n/22ooZHyg8UJmK8b6MuejX4f2sCFTfkMli26vyPmduSp+8Y+25bpEEF2HET0U6IFrc2bV7rlo0UqaRlqvSb19BDt1EygUrvxhhrlQtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442749; c=relaxed/simple;
	bh=1W5Sxy12Ogp8A7y6gf9ny6a0gyAw1CRnfeolqgDZBYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9pHZTMzl4x8Rd+BZsFu4FNVKIMKkqzEPmzOs3n5lVLDqbeDQZ0s/ieFp1MtJzwyj9F6tVnT57J1cXgk3g+NJVQaFLVxMviqXg8XRj94ufvBl72u28hBbdV4trODDuSf+WiXRRu3fwtk4dSsmd3V1aipMqzKrLoheUPdxqFh/gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=FXzwa5lL; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="FXzwa5lL"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-534e6545939so39692261cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 23:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791442746; cv=none;
        d=google.com; s=arc-20260327;
        b=bNIvv+dgqdfVUrhwpUgyRulhALoQlC3YwIOm/CPxJv73siR7Ad4E1gcMX7spxmkPYd
         48ZCQ4opNIwxa2EJVSnxgdqOLXKWBeQQCxeCcIJmHyVbxbe6xw+YK6qGAfumJexz2LGn
         yql7p43+cQk+CzpY4PNEkZZ6RjQuZxJ84fS6DWnvJt87W81fVX7HNsogoC7YSED4cFnh
         DXsEoN7F746mRVfzPBH2PZ84JcztUaa43jMh27FQTpVlclRVWPxAJl/uxSva9hRu6X2T
         FTpKzrhXvivPneZ9A6W8j5c3lFfuwNUHONX5adTGqnryCbWFEjeZXgbXjVKQkl4el8SS
         3JjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3hU4nbWl8LrfKz8yVK4ZzMdYbOShSdSRkPWsTycbt8=;
        fh=kvleYM7Se4ovZGusiIvMf8g0rMtWvc5crpQiewFZrzs=;
        b=QOtRbRh/fHjNPlviWK5s5AzJQp2hszLTPWzWrIjdWQt85bMDqBIIzm+ypi1yzilRBH
         bXDo1/0DtBvED4m0Z1P62HP9TSSnWuvc+aNYhVtRXZOSkB2jgVgd7Xn9zuIxQRCBSz69
         1LNZcHX1Xn+9FVz9j3c/wVQK6oUF3axqLk6nCZnEIyAhOMdoCngEF/z7KiewUMAy3l/u
         wRsF3wMqPei8KwhwrxwQEsOnwJ7Fh84aHXhho4TO0CtsgWjUh/WwAYTXJn03tT3UO077
         fhb6S8WQiXwLgcBvVpwkeVckNOwQy68OtGvVoweM/gVafgQNOmItFf9FQywNFmtZR+mL
         kkFQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791442746; x=1792047546; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3hU4nbWl8LrfKz8yVK4ZzMdYbOShSdSRkPWsTycbt8=;
        b=FXzwa5lLEkNycZjsH7gal961nKdA5A81m9PXGayTSLPv+kUgH1PrUuqNTjzQVoypiI
         3sRC8zwehJLr1JJuUECiLm5mHDbDr8qisDu/BSKQkAiX4q0AKhSTlqlo2RVhqP9ooMPJ
         2KCkg2XPjYqAFywdQkOj/OZ916ytVLsGQjv50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442746; x=1792047546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L3hU4nbWl8LrfKz8yVK4ZzMdYbOShSdSRkPWsTycbt8=;
        b=L39UJ011SS73UYHmlH3wcOeU6j2bofT7g0woz/h8R05P7YBuU9FlSmtuMMqnHxqFGZ
         27uqgfpkmXU39+pPnv2P33S/jOOKwS5meL5b0BEh3tBGcxXQq9cDHAgqnLfUevCKjOP7
         jF7A+fvfyVyxiIOFLnSjui4FZuJJwl9Jjhd1Ey69Qqp0u98KbxkWVtT+5kvlJiE4kYBK
         Uc8UPg0pQRTSBhnQ/ngVZU6Wi7bOzfY0/57GmIGu24fNqSMrOA2NPZa+iBAasIry99w2
         wd9GR9IDRb29GSnsTPBgM0fzA4pyh+TfVn82fC8GF10NWFP5Yr0KD7X15qBKrRaJumca
         gBIA==
X-Forwarded-Encrypted: i=1; AKwUvBz7J29qda+Ee3NR6Q2nvakz5nx8m8ciYSl85sFceOum4afs2mdt4C0Oa18/DIDX39TvPfHDewM6v3Wk@lists.linux.dev
X-Gm-Message-State: AFuF++nz7Hb/FfJkay8cV+LyZ/nxdB/aJdsABmBaopg+75aRoCGnVjrg
	JhjncXJV8A4tBNF8/IzUXfcBmioLdx9/L5+sTj7fitsQVt/vsEPgidQ6ZV04s6ungHMNykPAyrC
	epcAjUXlIaqqx2MX3hyNDz1xCFIuf6Lf4Eyhgw9wHmA==
X-Gm-Gg: AYBFou1+wxDuFV4Swl45ecjjnr6s80T2P2nRZYhCliA+IAFFgcAalT0zvRoFYBLnZNj
	GExKLlCatEjvssXB+eO8JquGY14sD7TUeiqBpBPIkoapTqKVACJ1CgwUuyjXfNGbowhtllwPWGe
	gwvPqIAYpqUXZ2xwYtzt7xo+IrlGSfqOyGcmFvC4wkAcZIZBYMNVgrk52Xkgh11z5JJzg0wN8tP
	ZXyo9oW751hd5z179gE0NCmiFFesT5qDG2dYBWLAIXcxvwKC7GMVGI7ApVQKDbmRJZkk/BFFH2D
	eo7JSdua/maEbvtIChZPWePsPmQzWwEm1jq62ZLmptyzqLj8s4Mp6ahW5WFTg6pk1khnfrB9Kxu
	zOZLcoGyM/7+oQgtmwpdk62k=
X-Received: by 2002:ac8:5a49:0:b0:535:10be:7d5e with SMTP id
 d75a77b69052e-53575545a1cmr89724491cf.46.1791442746044; Wed, 07 Oct 2026
 23:59:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006180115.1425232-1-mszeredi@redhat.com> <20261006180115.1425232-3-mszeredi@redhat.com>
 <asbrrhh0BrBDDOkj@aschofie-mobl2.lan>
In-Reply-To: <asbrrhh0BrBDDOkj@aschofie-mobl2.lan>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 8 Oct 2026 08:58:54 +0200
X-Gm-Features: AclHuK9mcs0U3g8nRj25-jK3khFgy-18rAJm04RUxSKhCvNJcpCBMTzwyQNv4BE
Message-ID: <CAJfpeguxsc2ehKK9cDWx4r8Mk-VNQHGU9Soag=-qzowVkoosxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] dax: use READ_ONCE() in dax_holder()
To: Alison Schofield <alison.schofield@intel.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J . Wong" <djwong@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Oct 2026 at 03:03, Alison Schofield
<alison.schofield@intel.com> wrote:
> As written, it suggests that READ_ONCE() makes a non-NULL result safe against
> concurrent fs_put_dax(). However, READ_ONCE() only controls the pointer load, but
> IIUC it does not protect the lifetime of the returned holder.

Right, the changelog was a bit hurried.  Will fix.

> Also, is this RCU-based lifetime handling specific to the new FUSE implementation,
> or is it intended to establish a general requirement for DAX holders and callers
> of dax_holder()?

I haven't looked.  The RCU based fix only works as long as the memory
failure handler doesn't need to sleep.   I cannot make a comment on
the xfs code.

Thanks,
Miklos
