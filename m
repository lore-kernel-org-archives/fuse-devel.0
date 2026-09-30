Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64723EC817
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763326; cv=pass; b=HYWv6NgrM3YLMmhgclEf3X7bJVPdEgYFW7jQ9uTeWpPLewutKIO8gzqnWmZmZosEP7nX+v4ViqEUcFuheZZIBhkMnQ/bLBJIr0KauLkRWoD6DE375j78wGIu23Wquxfkw2nURVnYGigbCVba2myhfHTIrbWawQZQQeD7gdzkIPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763326; c=relaxed/simple;
	bh=fBqT7HkRPsnhHCiCYP5abo+iF0ByEwD3b4KebIwbmOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bq0rgP4XbXG4hQM1v8kA/pxAG6kJBmELVqV7OJ2WhSBm5OCxfzSkFPQpz93jl7fS38tIN63uKN7rRPYUPdtBE31Jnde1T0DcVQ1C3MHsk/Nz/inZ51tXgdkNYELzVFEfPfOXtd/bUrROuRacrcCTkQERJ3iMuN2CGV8NbWGVAxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gzZK3+Ho; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gzZK3+Ho"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5332048323bso39266671cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 03:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790763322; cv=none;
        d=google.com; s=arc-20260327;
        b=W/AfYd7W0gAEqyvxJHgoNXXPKLM0oXxLUDuLhRdvQzbwdmUc0KIq7svGvPy/Taw9NJ
         ud/FRzuvN6MGtrTC1wcKqoE0snSh5rB7ghV2JkYuObszl6mjZVduo6ON8Qaa+iG6JoEf
         0GJabECsrEw7FbrXxTqiqbLCQTZ5MOZHt3wZXChuuIEzM4FO4vSZ4rp2KGXqi7ML9gpu
         tBXO51jwTNEvMhMmoiFlalXKqVbbw+YDtNA6yPmnn3YqxczOn/PAsOXliesMvqpadeCq
         kysCCS9EFYIfkxFbkvLJ1COJXD2AIqQ/Sq67/60IzNYMGTeAzY64ysOjJh8bFLnc32ep
         zsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x5WBrU2mM1HzF02fnJoPPlejfReiUi19leK9uBfuCZA=;
        fh=P6DVf6Qi+f1xryKUpWGFEGRotnYE1sx2LMxg27aMWBo=;
        b=Liux2b28xGQnxqPpiUfZNNtRaTGY/wAT9ssK6IQeTDcnEp+OYoZ8yZA7zwB64w9mDL
         cxHIO8yaDssVevgAkDTtq+Bq8kraiGCz9A7JPsNWL819rH/PIlADPIOWYVnp4PeZGbxe
         CP7KODzurH+9F3GP1etGNs2s1vWOKOLlUJV2CIiT0+VHicTUi8VIww7SfWvXcTc3HLg4
         vSGuF1P/4pk6HnExQAJQK5K1Nc4BReG9rVdjaQPCNk1JQAYyDQyYptuflnfu4wdWJuXG
         h8XB58Ff/dZq9W+U9buTFZ6CTMaYqJDKNBloSUrQOvvbBHMeHIwImnsT8V/lEQzJ3F1P
         lKKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790763322; x=1791368122; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5WBrU2mM1HzF02fnJoPPlejfReiUi19leK9uBfuCZA=;
        b=gzZK3+HosJCnSwuu3A4ra+EphqLeiBCa6S1GaIXhO28RA/YZr4qCN4TUZv1Mabf+Xk
         2dmvB227FxtTRoA5Lc2OOP1UtwRfwY0m+UatUpMO475qcgKye5k9q0Jkccw4Q4GczN16
         Cc0e/bwWq/i3LkNe2/SHv+IyyvxI98kkyN2lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763322; x=1791368122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x5WBrU2mM1HzF02fnJoPPlejfReiUi19leK9uBfuCZA=;
        b=DkIgKW4GYYXvs5IFA3jWJNm+6mggIB+vL9bRLnM7z21OiMhwD5FKxGgLhmpVODfHEV
         PwevUrF80bJ92veJnDMUSwejd3476TL+LIgIjCMTo35SgxUi3DHdPSLF67zmgpb6RIS5
         OiFRP4nNTqKltjgN0wBLAuvYozSfMIauYt+zXdYZ8J7QF6cyBiLko5b5FsiLVkjxTG/2
         e0zOCitWU9p5K/9DHqJ7ksULdKnArziq2a6OEUvz4cdKPSCdUtMgAQ6qZ/DIUoB6aoqd
         LgaUesMFQPIX9Ehtbt796N/EmhlGnSworCWJLOVPBN+GZ/ePXA8/f30Y3YmVRXxevPg5
         VFlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2DdG6+/Z1V88vwIhEdWGMRjz3SmTpEo6wKuJ4QWyztxOeYj3aubLpVox/Lwsf7rnJ2LFHQDSu3f0e@lists.linux.dev
X-Gm-Message-State: AFuF++nPs2bhXJxqoFShLRImDtyf7Eh0j6vAMyxnrAepvoDrfwMFBwL4
	fkpjph4h/i7R3Pvpu1SYss3QoVWbDkQ77yJ75VhxmiNVjJ+Frtkh7CD0Uhzu2s95IQdbegvgOqB
	l0oP0haG62i5o2e45MqTN1ohfVfOBIbIQo0rNuW7RwA==
X-Gm-Gg: AYBFou1R+oLWPh0FGj8II8OJUZDUPx2Do9/DaOCHTa91Q/WKFqqX6E/EHG42JyHUOGT
	JZ53rz0BnLH2FK9eRL+YAuxV0uYW0ZiIKCtdJHxEo4JS5eiQlLs5tn9oH/dYTN19mmekoyEhkwq
	oedbWEUBFJOYCJQRc6X8XrTbNuAkw0D13iDliXX1JnYIZHgzGL/fc+C7OCg5TbOv2dNgp/gsknk
	6hieIMGzQ+eKDmaso+FVGK3PCIiozkdUHnYfcr4sGQEJYxbxwNIahUI5or+pPwDs/2Tr9i5qXG9
	G1DNLs6ZfAYEk/mesHo7e768o3hRxJcWnJiyq7eRrBFcUQNpJ23ukCL5XVrDdLpKhxILY+anpjy
	RbK+xRFrerTQbLQ==
X-Received: by 2002:ac8:7f45:0:b0:533:2826:293c with SMTP id
 d75a77b69052e-533740f52cemr17762451cf.6.1790763322298; Wed, 30 Sep 2026
 03:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061019.3320196-1-mszeredi@redhat.com> <20260922061019.3320196-7-mszeredi@redhat.com>
 <CAOQ4uxgfEM3CiBCCu53MDJnHDiYOmmMB5zZ1pqABUPiFag67-g@mail.gmail.com>
In-Reply-To: <CAOQ4uxgfEM3CiBCCu53MDJnHDiYOmmMB5zZ1pqABUPiFag67-g@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 30 Sep 2026 12:15:11 +0200
X-Gm-Features: AclHuK8dMzAHa3vutO_FhjWH7XrrgJXTf2JcpWmm-hcS6aMSdKNd_L6QVAwutco
Message-ID: <CAJfpegupC6qG3GcziSeqzNUz7OjWcaxPV2TydBBO7hShm02CHg@mail.gmail.com>
Subject: Re: [PATCH 06/11] fuse: support 64 bit, server allocated backing ID
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	John Groves <john@groves.net>, "Darrick J . Wong" <djwong@kernel.org>, 
	Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sept 2026 at 09:09, Amir Goldstein <amir73il@gmail.com> wrote:

> On second look at this uAPI and after failing to retrofit ops_mask into
> fuse_backing_map, I think it would be better, along with init flag
> FUSE_PASSTHROUGH_V2, to decommission both old ioctls
> and use new ioctl with consistent verbs for the new notify's:

Yes, unfortunately the "map" verb is overloaded:

 - map from backing_id to realfile
 - extent map

Would be nice to find something better for the backing_id mapping to
avoid confusion.

How about:

  FUSE_DEV_IOC_BACKING_CREATE/struct fuse_backing_create_in
  FUSE_NOTIFY_BACKING_REMOVE/struct fuse_backing_remove_out

?

I'm not opposed to FUSE_NOTIFY_BACKING_MAP, as that tells us it's
operating on a backing.

Thanks,
Miklos
