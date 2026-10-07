Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E44A5EA1
	for <fuse-devel@lists.linux.dev>; Wed,  7 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377697; cv=pass; b=UOT64Vdc3ZnXXyZaT9ETGGJp86gg0zz+jR1oZRPQUMHXJmH1ltHp2sL2eug8fBOBPDRWGhxu8B4azacQkEc91aGSyI0rTRZ2e/bsku7VZIoDQlKPgdB4GbO5uVN26njCQ/EQ3ar9DMYvwCnCYNP0OQaPsIcF01bNPRExS5dBGFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377697; c=relaxed/simple;
	bh=mZxD1Ygf+pj4Ki80fWTjetLEhLjuY+js/KB32uhXOlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9Y4Pk4FyjsO44qLEgpHSag4psEJvh1m3J9Y9tmJZo9St1eIDRifMRkdKYuXNUoLjcW/gqck5ZrzKynVoDG5voBow2CBz3LzVb/ySNQY0hAhRXvxM2Fu5CAJ1mkSEH44vT6xEQ0IWonwsvi9KRPpMDuAVlEWxTyZxKqLLlqUUUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=McygKWhP; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="McygKWhP"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5337fb43c16so17642991cf.3
        for <fuse-devel@lists.linux.dev>; Wed, 07 Oct 2026 05:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791377687; cv=none;
        d=google.com; s=arc-20260327;
        b=b9oB0pdM9cJAjuY1Ub45SHY4ukzCeol/Zlr9P3vqK+63WuVCyOka947/Qm6dPQ3vs9
         L4WQ5TE5mnNmD1QS+CNgq/i5qHo9j/GwHxM9ZoTR3eCsu7mR5oZ5GP5lFnx1Wb1Q0Ud8
         t3no4DT3zVoG/FrDmZ6Wbi606IoZXJIXfIkKHvOwBNggmNaFvGBE7T2/8pcRvAtwng+e
         hhsYSqlpT9wNSD6IH4q476VWxEgci+2jrrsbAUxZxqcr+EY6MLlvvnbNzOoX+vC7UNX2
         X27ubRXRx2ASF7ml9fcmRY1GqNU0s1HQ7QXb252yKt9mgyDQc6ohaqSx94FE1vLTs6dK
         FExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PgzrrYK6etiYHLS8TerK5hAVSfusAUIu6hnQPEz0+jc=;
        fh=i5Fs7hEBTEYVhw7TP2cHD/5T/vlMbFje/Mslvj4hhTc=;
        b=DD2DF30YzFBxWVU8lxc/0IaAckaH/7tUUfj0d5JpRXxL+4Aq9+oU4JzF1FgIVKr1mr
         3YzLW9TvvOxny6BB8e1dA22XNbHBPDIg3Ch7GHrk5Ja5ElanlVIVt/VNgkY1cxtvmheh
         woJlUgUuo1QBn795i263AJmpNHR4iQEVGrICuRA8alWUhSbDFO9uEDfToUfCMORFhGWh
         eTYOIjt0UZSED2iZuErmoMvpBKyBOHR1MbSIRPzk35Tt+pmwPyxurDCXn7LNFfV9c9UZ
         tAYcRCFRHpeMplQk1Ndy5vT92Z4LkBGWfawUfexxp0a1uyp1jhqw9E31U7aqW7zB3Uu7
         z8mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1791377687; x=1791982487; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgzrrYK6etiYHLS8TerK5hAVSfusAUIu6hnQPEz0+jc=;
        b=McygKWhPYkSV/z2dtIOYoUpXZJ4au33Z9gLfsRGEU4Iz9WPo/pGk9itPekjOVqLaHs
         TaLLTfoJOTQ8k2oUVIyHc+cdmj+AdZcbejhfjwtDCLFXsEYLlm4ZXTI3tGcjf/P8Q2bh
         X9cDZDbdMQxnvMRnyVIyLdAPmTHuBwKLZkavM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377687; x=1791982487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PgzrrYK6etiYHLS8TerK5hAVSfusAUIu6hnQPEz0+jc=;
        b=dXeEWAmmxCTB1YcjXgW2Q6UPDNR7M28iCyngDpGoWn5uZPPJ+TFAX+ASyPDkpvejUt
         J059HEBMteaMkzeVUEBAIXNFQq8ckgyJr5Le78EmIGInIf3nS6Ho4oSJSat/WVU8wqyV
         +9h4bCoJPNkaE6/ki01cDm61vixtashdhiW1BIVE7VhuUq9vlqiTZagMiKCuSgf0YI2l
         0CHSG48MO0aJswj1IzB/36gDFvXXGSuO13W20XuOwvRPeCHNndb4tXJ40ZSrhJPD2qd1
         WiD5OrpFtU31bqXwx5gOmmRKcBrm7UOFV662b3ozfgKwrXbzxZgGa10E8GZZBMnm5Dmy
         8RnA==
X-Forwarded-Encrypted: i=1; AKwUvBwCJ3eOUHne3GfE6FFxs119d9aD7fcNm47WDmyfpSJgqWo5o1Ux0ENrf1+tgceGJBfnpPoKfA6MCWXh@lists.linux.dev
X-Gm-Message-State: AFuF++ngri6plvrRmL/UNZvhxuRaLG3apDi/xnzxjS+/mJ4Lf+GAVOLh
	dz25YhLzg5LlX6LR4fJ2TBKWmLBrk4CpCNhvsu8StDnTZ04x7A2xU+qqbS4RySJqvhqMAnpAWYN
	tSanCmhPmXAcDzOV6koTRpZenB1sLGSudR+ltXW96lQ==
X-Gm-Gg: AYBFou0Hk9OIg45aO5jtZQAPhy9gEJDrnQF57QDAFvjRqT48FeyaTiDJJpCYoDSy2Ji
	sXg9sDnDOZkcX9J7LvwEvaz0vXwtIWgYDXxpqxYdlphTIOZwI5X+u0tTloftHrtjHgXVHqBnhmo
	MykZQFRw6ttNlOeuh63S1qq2GV1pBNHHtXmhsJ10cHCH6LWpEbSEoT0MyKt07NIwI22tATypZU2
	dQ0Klk6HsXqUFMRFJ+7X82mC2VwQQue+E1R9UTwz5YJOxYtGVlRircdrhF9sTpY/brTlMlmo8fW
	sAEuzkd+rc6WUcO5tsmR3MOORddx6JbRg2YSGiMa2YARVqmoUgFz0bMiPU5kbvIuMZcRVKr23wr
	vkV9eyPyG1/WK
X-Received: by 2002:a05:622a:955:10b0:535:863a:7cd5 with SMTP id
 d75a77b69052e-535863a7d68mr329801cf.41.1791377687608; Wed, 07 Oct 2026
 05:54:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006180115.1425232-1-mszeredi@redhat.com> <20261006180115.1425232-5-mszeredi@redhat.com>
 <CAOQ4uxjRAgNKEKOj3yrh0fp_uBdQ-G=5C55G6M8vyjWgp2zvoA@mail.gmail.com>
In-Reply-To: <CAOQ4uxjRAgNKEKOj3yrh0fp_uBdQ-G=5C55G6M8vyjWgp2zvoA@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 7 Oct 2026 14:54:35 +0200
X-Gm-Features: AclHuK-2JR3jF5vhr6-2N836D1tWhMAXJTWcwxFUH5uC3YviT4HdxQEL0a7ZY6w
Message-ID: <CAJfpegsK3ydDW4Hy+yKxxnHsx7nPSSuC1aqOnOPjkD=g33jY_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] fuse: support 64 bit, server allocated backing ID
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 00:12, Amir Goldstein <amir73il@gmail.com> wrote:

> #define FUSE_PASSTROUGH_PARAMS(max_backing_stack_depth, flags) \
>              ((max_backing_stack_depth & 0xff) + 1) | ((flags & 0xff) << 8)

I don't think that beast belongs in a public header.   That alone is a
reason not to go this way.

> It also avoid the unneeded questions/documentation/awkwardness
> regarding FUSE_PASSTHROUGH_V2 with/out FUSE_PASSTHROUGH

"If FUSE_PASSTHROUGH_V2 is set, FUSE_PASSTHROUGH is ignored"

Thanks,
Miklos
